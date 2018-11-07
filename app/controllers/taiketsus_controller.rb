class TaiketsusController < ApplicationController

    def index
      hash = {}
      keys = []
      @taiketsus = Taiketsu.all
      @taiketsus.each do |taiketsu| 
        comments = taiketsu.topics.joins(:comments).group(:topic_id).count
        if comments.values[0].blank? && comments.values[1].blank?
          sum = 0
        elsif comments.values[0].blank? 
          sum = comments.values[1]
        elsif comments.values[1].blank? 
          sum = comments.values[0]
        else 
          sum = comments.values[0] + comments.values[1]
        end
        hash[taiketsu.id] = sum
      end
      @comment_hash = hash.sort_by {| k, v | v}.reverse
      @comment_hash.each do |key|
         keys << key[0]
      end

      taiketsus_array = keys.map { |id| Taiketsu.find(id) }
      @hot_taiketsus = Kaminari.paginate_array(taiketsus_array).page(params[:page]).per(12)
      @accepting_taiketsus= Taiketsu.includes(:topics).page(params[:page]).per(6).order("created_at DESC")
      @taiketsu = Taiketsu.new
      @taiketsu.topics.build
    end

    def show
      @session = session[:session_id]
      @taiketsus = Taiketsu.new
      @taiketsus.topics.build

      @taiketsu = Taiketsu.find(params[:id])
      @taiketsu_topics = @taiketsu.topics
      @topic_first = @taiketsu_topics.first
      @topic_second = @taiketsu_topics.second

      @comment = Comment.new
      @comments_first = @topic_first.comments
      @comments_second = @topic_second.comments

      @accepting_taiketsus = Taiketsu.includes(:topics).page(params[:page]).per(6).order("created_at DESC")
    end

    def create
      @taiketsu = Taiketsu.new(taiketsu_params)
      @taiketsu.session_id = request.session_options[:id]
      if @taiketsu.save
        redirect_to taiketsus_path
      else
        render :show
      end
    end

    def destroy
      @taiketsu = Taiketsu.find(params[:id])
      @taiketsu.destroy
      redirect_to taiketsus_path
    end

  private

    def taiketsu_params
      params.require(:taiketsu).permit(
        topics_attributes: [:topic]
      )
    end

end

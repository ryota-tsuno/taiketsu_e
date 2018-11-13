class TaiketsusController < ApplicationController
    before_action :set_taiketsu, only: [:index, :show]

    def index
      @hot_taiketsus = Taiketsu.where(id: @keys).order(['field(id, ?)', @keys]).page(params[:page]).per(12)
      @accepting_taiketsus= Taiketsu.includes(:topics).page(params[:page]).per(6).order("created_at DESC")

      @random = Taiketsu.offset( rand(Taiketsu.count) ).first

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

      @show_taiketsus = Taiketsu.where(id: @keys).order(['field(id, ?)', @keys]).page(params[:page]).per(1)
      @accepting_taiketsus = Taiketsu.includes(:topics).page(params[:page]).per(6).order("created_at DESC")
    end

    def create
      @taiketsu = Taiketsu.new(taiketsu_params)
      @taiketsu.session_id = session[:session_id]
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

    def set_taiketsu
      hash = {}
      @keys = []
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
      @comment_arrays = hash.sort_by {| k, v | v}.reverse
      @comment_arrays.each_with_index do |array, index|

        # paramsのidがコメント数でsortした配列のidに一致
        if params[:id].to_i == array[0]
          # 配列が先頭だったら
          if index == 0
            @prev = 0
            @next = @comment_arrays[index+1][0]
          # 配列が最後だったら
          elsif index == @comment_arrays.length - 1
            @prev = @comment_arrays[index-1][0]
            @next = 0
          # それ以外
          else 
            @prev = @comment_arrays[index-1][0]
            @next = @comment_arrays[index+1][0]
          end
        end
        @keys << array[0]
      end
      
    end
    
end

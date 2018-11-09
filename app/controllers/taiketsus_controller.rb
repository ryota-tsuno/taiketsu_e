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
    end
    
end

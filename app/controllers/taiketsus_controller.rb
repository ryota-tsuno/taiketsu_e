class TaiketsusController < ApplicationController
  before_action :set_taiketsu, only: [:show]

    def index
      @session = request.session_options[:id]
      @taiketsus = Taiketsu.includes(:topics).page(params[:page]).per(12).order("id")
      @accepting_taiketsus= Taiketsu.includes(:topics).page(params[:page]).per(6).order("created_at DESC")
      @taiketsu = Taiketsu.new
      @taiketsu.topics.build
    end

    def show
      @taiketsus = Taiketsu.new
      @taiketsus.topics.build
      @taiketsu = Taiketsu.find(params[:id])
      @comment = Comment.new
      @comments = Comment.includes(:topic)
      @accepting_taiketsus = Taiketsu.includes(:topics).page(params[:page]).per(6).order("created_at DESC")
    end

    def create
      @taiketsu = Taiketsu.new(taiketsu_params)
      if @taiketsu.save
        redirect_to taiketsus_path
      else
        render :show
      end
    end

  private

    def set_taiketsu
      @taiketsu = Taiketsu.find(params[:id])
    end

    def taiketsu_params
      params.require(:taiketsu).permit(
        topics_attributes: [:topic]
      )
    end

end

class TaiketsusController < ApplicationController
  before_action :set_taiketsu, only: [:show]

    def index
      @taiketsus = Taiketsu.order("id").page(params[:page]).per(12)
      @taiketsu = Taiketsu.new
      @taiketsu.topics.build
    end

    def show
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

    def set_topic
      @topic = Topic.find(params[:id])
    end

    def taiketsu_params
      params.require(:taiketsu).permit(
        topics_attributes: [:topic]
      )
    end
end

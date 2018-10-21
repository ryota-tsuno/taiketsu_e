class TaiketsusController < ApplicationController
  before_action :set_taiketsu, only: [:show]

    def index
      @taiketsu = Taiketsu.new
    end

    def show
    end

    def create
      @taiketsu = Taiketsu.new(taiketsu_params)
      if @taiketsu.save
        redirect_to taiketsu
      else
        render :index
      end
    end

    private

    def set_taiketsu
      @taiketsu = Taiketsu.find(params[:id])
    end

    def taiketsu_params
      params.require(:taiketsu).permit(
        topics: [:topic, :id]
      )
    end

end

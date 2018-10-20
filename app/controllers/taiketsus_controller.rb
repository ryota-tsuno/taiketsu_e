class TaiketsusController < ApplicationController

    def index
      @taiketsu = Taiketsu.new
      @topic = Topic.new(topic_params)
    end

    def show
      @topic = Topic.new(topic_params)
    end

    def create
      @topic = Topic.new(topic_params)
      if @topic.save
        redirect_to taiketsu
      else
        render :index
      end
    end

    private

    def topic_params
    end

end

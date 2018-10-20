class TopicsController < ApplicationController

    def index
    end

    def show
    end

    def create
      @topic = Topic.new(topic_params)
      if @topic.save
      redirect_to topic
      else
        render :back
      end
    end

    private

    def topic_params

    end
end

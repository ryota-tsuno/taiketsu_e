class TopicsController < ApplicationController
    
    def index
        @topics = Topic.order("id").page(params[:page]).per(5)
    end

    def show
    end
    
end
class AboutsController < ApplicationController

    def index
      @taiketsu = Taiketsu.new
      @taiketsu.topics.build
    end
    
end

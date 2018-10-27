class CommentsController < ApplicationController

    def create
        @topicId = Taiketsu.joins(:topic_id).where.not(topic_id: nil)
        @comments = Comment.create(text: comment_params[:text], topic_id: comment_params[:topic_id], session_id: request.session_options[:id])
        binding.pry
        redirect_to abouts_path
    end

    def destroy
        if @comments == taikestus.session
            comments.destroy
        end
    end

    private

    def comment_params
        params.permit(:text, :topic_id)
    end
end
class CommentsController < ApplicationController

    def create
        @comment = Comment.new(text: comment_params[:text], topic_id: comment_params[:topic_id])
        @comment.session_id = session[:session_id]
        if @comment.save
          respond_to do |format|
            format.html { redirect_to taiketsu_path(params[:taiketsu_id]) }
            format.json
          end
        else
          flash.now[:alert] = 'コメントを入力してください'
          redirect_to taiketsu_path(params[:taiketsu_id])
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:text, :topic_id, :taiketsu_id)
    end

end

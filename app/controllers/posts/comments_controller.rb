# frozen_string_literal: true

module Posts
  class CommentsController < ApplicationController
    def create
      @post = Post.find_by(id: params[:id])
      comment = @post.comments.build
      comment.update(comment_params)
      @post.reload
      respond_to do |format|
        format.js
        format.json { render json: comment, status: :created }
      end
    end

    private

    def comment_params
      params.require(:comment).permit(:body)
    end
  end
end

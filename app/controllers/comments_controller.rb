# frozen_string_literal: true

class CommentsController < ApplicationController
  def update
    comment = Comment.find_by(id: params[:id])
    comment.update(comment_params)
    @post = comment.post
    respond_to do |format|
      format.js
      format.json { render json: comment, status: :ok }
    end
  end

  def destroy
    comment = Comment.find_by(id: params[:id])
    @post = Post.find_by(id: comment.post_id)
    comment.destroy
    respond_to do |format|
      format.js
      format.json { render json: comment, status: :ok }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end

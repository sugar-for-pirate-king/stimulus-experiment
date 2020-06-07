# frozen_string_literal: true

module Posts
  # Post like
  class LikesController < ApplicationController
    def create
      @post = Post.find_by(id: params[:id])
      @post.update(likes: @post.likes + 1)
      respond_to do |format|
        format.js
        format.json { render json: @post, status: :ok }
      end
    end
  end
end

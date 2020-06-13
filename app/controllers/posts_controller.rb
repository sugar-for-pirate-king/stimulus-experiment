# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @posts = Post.all
    @posts = @posts.limit(params[:limit]) if params[:limit].present?
    if params[:query].present?
      @posts = @posts.where('title LIKE ?', "%#{params[:query]}%")
    end
    respond_to do |format|
      format.html { render :index }
      format.js
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
  end
end

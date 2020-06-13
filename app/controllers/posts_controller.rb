# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @posts = Post.all
    if params[:query].present?
      @posts = @posts.where('title LIKE ?', "%#{params[:query]}%")
    end
    set_page_and_extract_portion_from @posts
    @records = @page.last? ? @page.recordset.records : @page.records
    respond_to do |format|
    format.html { render :index }
      format.js
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
  end
end

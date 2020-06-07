# frozen_string_literal: true

class Post < ApplicationRecord
  has_many :comments

  def recent_comments
    comments.order(updated_at: :desc)
  end
end

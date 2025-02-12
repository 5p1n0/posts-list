class Api::PostsController < ApplicationController
  def index
    if params[:term].present?
      term = params[:term]
      @posts = Post
        .includes(:tags)  # if is necessary to return all the tags replace with: .joins("FULL JOIN tags ON tags.post_id = posts.id")
        .where("title LIKE ? OR tags.name LIKE ?", term, term)
        .references(:tags)
      render json: serialize_posts(@posts)
    else
      @posts = Post.includes(:tags) # Eager loading
      render json: serialize_posts(@posts)
    end
  end

  def serialize_posts(posts)
    posts.map do |post| # Use argument
      {
        title: post.title,
        id: post.id,
        tags: post.tags.map { |tag| { name: tag.name } }
      }
    end
  end
end

class Api::V1::ArticlesController < ApplicationController
  # Skip authentication only for the index and show actions
  skip_before_action :authenticate_user!, only: [:index, :show]

  # GET /api/v1/articles
  # Fetches a list of articles with optional filters for category, article type, author, and tags.
  def index
    articles = Article.includes(:category, :author, :tags).order(publish_date: :desc)

    # Apply filters if parameters are present
    articles = articles.where(category_id: params[:category_id]) if params[:category_id].present?
    articles = articles.where(article_type: params[:article_type]) if params[:article_type].present?
    articles = articles.where(author_id: params[:author_id]) if params[:author_id].present?
    articles = articles.joins(:tags).where(tags: { name: params[:tag] }) if params[:tag].present?

    # Render articles as JSON, including associated category, author, and tags
    render json: articles, include: [:category, :author, :tags]
  end

  # GET /api/v1/articles/:id
  # Fetches a single article by its ID, including associated category, author, and tags.
  def show
    article = Article.find(params[:id])
    render json: article, include: [:category, :author, :tags]
  end
end

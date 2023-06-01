class MoviesController < ApplicationController
  def index
    if params[:query].present?
      # ACTIVE RECORD
      # @movies = Movie.where(title: params[:query])
      # @movies = Movie.where("title ILIKE ?", "%#{params[:query]}%")
      # query = "movies.title @@ :query OR movies.synopsis @@ :query OR directors.first_name @@ :query OR directors.last_name @@ :query"
      # @movies = Movie.joins(:director).where(query, query: "%#{params[:query]}%")

      # @movies = Movie.search_by_title_and_synopsis(params[:query])
      @movies = Movie.global_search(params[:query])
    else
      @movies = Movie.all
    end
  end
end

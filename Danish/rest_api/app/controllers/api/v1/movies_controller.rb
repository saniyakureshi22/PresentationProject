module Api
	module V1
		class MoviesController < ApplicationController
			def index
				debugger
				@query = params[:query]
				if @query.present?
					movie_service = MovieService.new
					@movies = movie_service.search_movies(@query)
					render json: @movies
				else
					render json: { error: "Query parameter is missing" }, status: :unprocessable_entity
				end
			end

			def show
				imdb_id = params[:id]
				movie_service = MovieService.new
				@movie = movie_service.get_movie_details(imdb_id)
				render json: @movie
			end
		end
	end
end
class Api::V1::LanguagesController < ApplicationController
	def translate
    response = LanguageService.new.translate(params[:text], params[:target_language], params[:source_language])
    render json: response
	end

	def fetch_languages
    response = LanguageService.new.fetch_languages
    render json: response
	end
end

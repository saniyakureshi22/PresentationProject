module Api
  module V1
    class GithubApiController < ApplicationController
      rescue_from Octokit::NotFound, with: :render_not_found_response
      rescue_from StandardError, with: :render_error_response

      def repositories
        render json: fetch_data { client.repositories(ENV['GITHUB_USERNAME']).map(&:full_name) }
      end

      def commits
        repo_name = params[:repo_name]
        return render_error_response('Repo name is required', :bad_request) unless repo_name.present?

        render json: fetch_data { client.commits(repo_name).map { |commit| commit&.commit&.message } }
      end

      private

      def fetch_data
        yield
      rescue StandardError => e
        render_error_response(e.message)
      end

      def client
        Octokit::Client.new(access_token: ENV['GITHUB_ACCESS_TOKEN'])
      end

      def render_not_found_response(message = 'Not Found')
        render json: { error: message }, status: :not_found
      end

      def render_error_response(message = 'Internal Server Error', status = :internal_server_error)
        render json: { error: message }, status: status
      end
    end
  end
end

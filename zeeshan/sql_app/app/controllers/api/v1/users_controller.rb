class Api::V1::UsersController < ApplicationController
	
	def index
		query = "SELECT * FROM users"
		@users = ActiveRecord::Base.connection.execute(query)
    render json: @users
	end
	
	def show
		query = "SELECT * FROM users WHERE id = #{params[:id]}"
    @user = ActiveRecord::Base.connection.execute(query)
		render json: @user
	end

	def create
		query = "INSERT INTO users (first_name, last_name, email, created_at, updated_at) VALUES ('#{user_params[:first_name]}','#{user_params[:last_name]}', '#{user_params[:email]}', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP) RETURNING *"
    @user = ActiveRecord::Base.connection.execute(query)
		if @user.present?
			render json: @user
		else
			render error: { error: 'Unable to create User.' }, status: 400
		end
	end

	def update
	  @user = User.find(params[:id])

	  if @user
	    query = "UPDATE users SET first_name = '#{user_params[:first_name]}', last_name = '#{user_params[:last_name]}', email = '#{user_params[:email]}', updated_at = CURRENT_TIMESTAMP WHERE id = #{params[:id]}"
	    result = ActiveRecord::Base.connection.execute(query)

	    if result.cmd_tuples > 0
	      render json: { message: 'User successfully updated.' }, status: 200
	    else
	      render json: { error: 'Unable to update User.' }, status: 400
	    end
	  else
	    render json: { error: 'User not found.' }, status: 404
	  end
	end

	def destroy
	  @user = User.find(params[:id])

	  if @user
	  	articles_query = "DELETE FROM articles WHERE user_id = #{@user.id}"

	    query = "DELETE FROM users WHERE id = #{params[:id]}"

	    ActiveRecord::Base.connection.execute(articles_query)
      ActiveRecord::Base.connection.execute(query)
      render json: { message: 'User and associated articles successfully deleted.' }, status: 200
	  else
	    render json: { error: 'User not found.' }, status: 404
	  end
	end


	def like_query
    like_query = params[:query]

    query = "SELECT * FROM users WHERE first_name LIKE '%#{like_query}%' OR last_name LIKE '%#{like_query}%'"
    @users = ActiveRecord::Base.connection.execute(query)

    if @users.present?
      render json: @users, status: :ok
    else
      render json: { message: 'No users found matching the like query.' }, status: :not_found
    end
  end

  def count_query
    sql_query = "SELECT COUNT(*) AS user_count FROM users"
    @user_count = ActiveRecord::Base.connection.execute(sql_query).first['user_count'].to_i
    render json: @user_count, status: :ok
  end

  def inner_join_query
  	# get the counts of associated articles
    sql_query = <<-SQL
      SELECT users.*, COUNT(articles.id) AS articles_count
      FROM users
      INNER JOIN articles ON users.id = articles.user_id
      GROUP BY users.id
    SQL

    # get associated articles
    # sql_query = <<-SQL
    # SELECT users.*, articles.id AS article_id, articles.title AS article_title
    #   FROM users
    #   INNER JOIN articles ON users.id = articles.user_id
    # SQL

    @users_with_articles = ActiveRecord::Base.connection.execute(sql_query)
    @users_with_articles = @users_with_articles.map { |row| row.symbolize_keys }    
    render json: @users_with_articles
  end

	private

	def user_params
		params.require(:user).permit(:first_name, :last_name, :email)
	end
end

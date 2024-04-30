class Api::V1::UsersController < ApplicationController
  
  def index
    @users = ActiveRecord::Base.connection.execute("SELECT * FROM users")
    render json: @users
  end

  def inner_join
    @inner_join_result = ActiveRecord::Base.connection.execute("
      SELECT users.*, posts.*, comments.*
      FROM users
      INNER JOIN posts ON users.id = posts.user_id
      INNER JOIN comments ON users.id = comments.user_id
    ")
    render json: @inner_join_result
  end

  
  def left_join
    @left_join_result = ActiveRecord::Base.connection.execute("
      SELECT users.*, posts.*, comments.*
      FROM users
      LEFT JOIN posts ON users.id = posts.user_id
      LEFT JOIN comments ON users.id = comments.user_id
    ")
    render json: @left_join_result
  end

  
  def right_join
    @right_join_result = ActiveRecord::Base.connection.execute("
      SELECT users.*, posts.*, comments.*
      FROM users
      RIGHT JOIN posts ON users.id = posts.user_id
      RIGHT JOIN comments ON users.id = comments.user_id
    ")
    render json: @right_join_result
  end

  
  def full_join
    @full_join_result = ActiveRecord::Base.connection.execute("
      SELECT users.*, posts.*, comments.*
      FROM users
      FULL JOIN posts ON users.id = posts.user_id
      FULL JOIN comments ON users.id = comments.user_id
    ")
    render json: @full_join_result
  end
end

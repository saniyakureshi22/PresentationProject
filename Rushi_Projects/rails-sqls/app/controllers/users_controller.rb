class UsersController < ApplicationController
    def index
      sql = "SELECT * FROM users"
      @users = ActiveRecord::Base.connection.execute(sql)
      render json: @users
    end
  
    def show
      user_id = params[:id]
      sql = "SELECT * FROM users WHERE id = #{user_id}"
      @user = ActiveRecord::Base.connection.execute(sql).first
      render json: @user
    end
  
    def create
      name = params[:name]
      sql = "INSERT INTO users(name) VALUES ('#{name}')"
      ActiveRecord::Base.connection.execute(sql)
      render json: { message: "User created successfully" }
    end
  
    def update
      user_id = params[:id]
      name = params[:name]
      sql = "UPDATE users SET name = '#{name}' WHERE id = #{user_id}"
      ActiveRecord::Base.connection.execute(sql)
      render json: { message: "User updated successfully" }
    end
  
    def destroy
      user_id = params[:id]
      sql = "DELETE FROM users WHERE id = #{user_id}"
      ActiveRecord::Base.connection.execute(sql)
      render json: { message: "User deleted successfully" }
    end

    def posts_with_comments
        user_id = params[:id]
        sql = <<-SQL
          SELECT p.id as post_id, p.title as post_title, c.id as comment_id, c.content as comment_content
          FROM posts p
          JOIN comments c ON p.id = c.post_id
          WHERE p.user_id = #{user_id}
        SQL
        @posts_with_comments = ActiveRecord::Base.connection.execute(sql)
        render json: @posts_with_comments
      end
end
  
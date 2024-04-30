
class PostsController < ApplicationController
    def index
      user_id = params[:user_id]
      sql = "SELECT * FROM posts WHERE user_id = #{user_id}"
      @posts = ActiveRecord::Base.connection.execute(sql)
      render json: @posts
    end
  
    def show
      post_id = params[:id]
      sql = "SELECT * FROM posts WHERE id = #{post_id}"
      @post = ActiveRecord::Base.connection.execute(sql).first
      render json: @post
    end
  
    def create
      user_id = params[:user_id]
      title = params[:title]
      content = params[:content]
      sql = "INSERT INTO posts (title, content, user_id) VALUES ('#{title}', '#{content}', #{user_id})"
      ActiveRecord::Base.connection.execute(sql)
      render json: { message: "Post created successfully" }
    end
  
    def update
      post_id = params[:id]
      title = params[:title]
      content = params[:content]
      sql = "UPDATE posts SET title = '#{title}', content = '#{content}' WHERE id = #{post_id}"
      ActiveRecord::Base.connection.execute(sql)
      render json: { message: "Post updated successfully" }
    end
  
    def destroy
      post_id = params[:id]
      sql = "DELETE FROM posts WHERE id = #{post_id}"
      ActiveRecord::Base.connection.execute(sql)
      render json: { message: "Post deleted successfully" }
    end
  end
  
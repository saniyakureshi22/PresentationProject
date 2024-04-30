class CommentsController < ApplicationController
    def index
      post_id = params[:post_id]
      sql = "SELECT * FROM comments WHERE post_id = #{post_id}"
      @comments = ActiveRecord::Base.connection.execute(sql)
      render json: @comments
    end
  
    def show
      comment_id = params[:id]
      sql = "SELECT * FROM comments WHERE id = #{comment_id}"
      @comment = ActiveRecord::Base.connection.execute(sql).first
      render json: @comment
    end
  
    def create
      post_id = params[:post_id]
      content = params[:content]
      sql = "INSERT INTO comments (content, post_id) VALUES ('#{content}', #{post_id})"
      ActiveRecord::Base.connection.execute(sql)
      render json: { message: "Comment created successfully" }
    end
  
    def update
      comment_id = params[:id]
      content = params[:content]
      sql = "UPDATE comments SET content = '#{content}' WHERE id = #{comment_id}"
      ActiveRecord::Base.connection.execute(sql)
      render json: { message: "Comment updated successfully" }
    end
  
    def destroy
      comment_id = params[:id]
      sql = "DELETE FROM comments WHERE id = #{comment_id}"
      ActiveRecord::Base.connection.execute(sql)
      render json: { message: "Comment deleted successfully" }
    end
  end
  
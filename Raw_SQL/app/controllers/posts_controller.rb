class PostsController < ApplicationController
  def index
    @results = ActiveRecord::Base.connection.execute("SELECT * FROM posts")
  end
  def new
    @post = Post.new
  end
  
  def create
    title = params[:post][:title]
    content = params[:post][:content]
    
    sql = "INSERT INTO posts (title, content) VALUES (?, ?)"
    ActiveRecord::Base.connection.execute(sql, [title, content])
    
    redirect_to posts_path, notice: "Post successfully created"
  end
  
  def show
    @post = ActiveRecord::Base.connection.execute("SELECT * FROM posts WHERE id = #{params[:id]}").first
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
 def update
  sql = "UPDATE posts SET title = ?, content = ?, updated_at = ? WHERE id = ?"
  bind_values = [params[:post][:title], params[:post][:content], Time.now, params[:id]]
  ActiveRecord::Base.connection.execute(sql, bind_values)
  
  redirect_to post_path(params[:id]), notice: 'Post was successfully updated.'
end
  
  def destroy
    ActiveRecord::Base.connection.execute("DELETE FROM posts WHERE id = #{params[:id]}")
    redirect_to posts_path
  end
  
  
  private
  
  def set_post
    @post = Post.find(params[:id])
  end
  
  def post_params
    params.require(:post).permit(:title, :content)
  end
end
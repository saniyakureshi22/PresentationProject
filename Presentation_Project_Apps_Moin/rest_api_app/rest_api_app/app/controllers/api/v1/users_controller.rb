class Api::V1::UsersController < ApplicationController
  # GET /users
  def index
    @users = User.all
    render json: @users
  end
  
  # GET /users/:id
  def show
    @user = User.find(params[:id])
    render json: @user
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'User not found' }, status: :not_found
  end
  
  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: { error: 'Unable to create User' }, status: :bad_request
    end
  end
  
  # PUT /users/:id
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: { message: 'User successfully updated' }, status: :ok
    else
      render json: { error: 'Unable to update User' }, status: :bad_request
    end
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'User not found' }, status: :not_found
  end
  
  # DELETE /users/:id
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render json: { message: 'User successfully deleted' }, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'User not found' }, status: :not_found
  end
  
  private
  
  def user_params
    params.require(:user).permit(:username, :password)
  end
end

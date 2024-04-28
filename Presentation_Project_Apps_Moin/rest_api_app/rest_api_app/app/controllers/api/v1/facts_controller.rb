class Api::V1::FactsController < ApplicationController
  before_action :find_fact, only: [:show, :update, :destroy]
  
  def index
    @facts = Fact.all
    render json: @facts
  end
  
  def show
    render json: @fact
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Fact not found' }, status: :not_found
  end
  
  def create
    @fact = Fact.new(fact_params)
    if @fact.save
      render json: @fact, status: :created
    else
      render json: { error: 'Unable to create fact' }, status: :bad_request
    end
  end
  
  def update
    if @fact.update(fact_params)
      render json: { message: 'Fact successfully updated' }, status: :ok
    else
      render json: { error: 'Unable to update fact' }, status: :bad_request
    end
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Fact not found' }, status: :not_found
  end
  
  def destroy
    @fact.destroy
    render json: { message: 'Fact successfully deleted' }, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Fact not found' }, status: :not_found
  end
  
  private
  
  def fact_params
    params.require(:fact).permit(:fact, :likes, :user_id)
  end
  
  def find_fact
    @fact = Fact.find(params[:id])
  end
end

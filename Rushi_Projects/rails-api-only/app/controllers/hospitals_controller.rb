class HospitalsController < ApplicationController
  before_action :set_hospital, only: [:show, :update, :destroy]

  def index
    hospitals = Hospital.all
    render json: hospitals
  end

  def show
    render json: @hospital
  end

  def create
    hospital = Hospital.new(hospital_params)
    if hospital.save
      render json: hospital, status: :created
    else
      render json: hospital.errors, status: :unprocessable_entity
    end
  end

  def update
    if @hospital.update(hospital_params)
      render json: @hospital
    else
      render json: @hospital.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @hospital.destroy
    head :no_content
  end

  private

  def set_hospital
    @hospital = Hospital.find(params[:id])
  end

  def hospital_params
    params.require(:hospital).permit(:name, :address, :phone)
  end
end

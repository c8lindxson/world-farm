class FarmsController < ApplicationController
  def index
    @farms = Farm.all
    @farm = Farm.new
  end

  def show
    @farm = Farm.find(params[:id])
  end

  def new
    @farm = Farm.new
  end

  def create
    @farm = Farm.new(farm_params)
    if @farm.save
      redirect_to farm_path(params[:id])
    else
      render :new, :unprocessable_entity
    end
  end

  private

  def farm_params
    params.require(:farm).permit(:name)
  end
end

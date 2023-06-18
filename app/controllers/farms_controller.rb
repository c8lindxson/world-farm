class FarmsController < ApplicationController
  def index
    @farms = Farm.all
    @farm = Farm.new
  end

  def show
    @farm = Farm.find(params[:id])
    @tomatoes = @farm.tomatoes
    @wheats = @farm.wheats
    @cows = @farm.cows
    @chickens = @farm.chickens
  end

  def new
    @farm = Farm.new
  end

  def create
    @farm = Farm.new(farm_params)
    if @farm.save
      redirect_to farms_path(params[:id])
    else
      render :new, :unprocessable_entity
    end
  end

  private

  def farm_params
    params.require(:farm).permit(:name)
  end
end

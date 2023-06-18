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

  def add_tomato
    @farm = Farm.find(params[:id])
    @tomato = @farm.tomatoes.build

    if @tomato.save
      redirect_to farm_path(@farm), notice: 'Tomato added to farm.'
    else
      redirect_to farm_path(@farm), alert: 'Failed to add tomato to farm.'
    end
  end

  def add_wheat
    @farm = Farm.find(params[:id])
    @wheat = @farm.wheats.build

    if @wheat.save
      redirect_to farm_path(@farm), notice: 'wheat added to farm.'
    else
      redirect_to farm_path(@farm), alert: 'Failed to add wheat to farm.'
    end
  end

  def add_cow
    @farm = Farm.find(params[:id])
    @cow = @farm.cows.build(gender: Cow::GENDER.sample)

    if @cow.save
      redirect_to farm_path(@farm), notice: 'cow added to farm.'
    else
      redirect_to farm_path(@farm), alert: 'Failed to add cow to farm.'
    end
  end

  def add_chicken
    @farm = Farm.find(params[:id])
    @chicken = @farm.chickens.build(gender: Chicken::GENDER.sample)

    if @chicken.save
      redirect_to farm_path(@farm), notice: 'chicken added to farm.'
    else
      redirect_to farm_path(@farm), alert: 'Failed to add chicken to farm.'
    end
  end

  private

  def farm_params
    params.require(:farm).permit(:name)
  end
end

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

  def water_tomato
    @farm = Farm.find(params[:id])
    @tomato = Tomato.find(params[:tomato_id])
    @tomato.water += 1
    @tomato.save
    if @tomato.water >= 15
      @tomato.crop += 1
      @tomato.water = 0
      @tomato.save
    end
    redirect_to farm_path(@farm)
  end

  def water_wheat
    @farm = Farm.find(params[:id])
    @wheat = Wheat.find(params[:wheat_id])
    @wheat.water += 1
    @wheat.save
    if @wheat.water >= 15
      @wheat.crop += 1
      @wheat.water = 0
      @wheat.save
    end
    redirect_to farm_path(@farm)
  end

  def feed_chicken
    @farm = Farm.find(params[:id])
    @chicken = Chicken.find(params[:chicken_id])
    feed_animal(@chicken, 10)
  end

  def feed_cow
    @farm = Farm.find(params[:id])
    @cow = Cow.find(params[:cow_id])
    feed_animal(@cow, 15)
  end

  private

  def farm_params
    params.require(:farm).permit(:name)
  end

  def feed_animal(animal, threshold)
    animal.energy += 1
    if animal.energy >= threshold
      animal.energy = 0
      animal.increment_resource_count
    end
    animal.save
    redirect_to farm_path(@farm), notice: 'Animal fed successfully.'
  end
end

class ChickensController < ApplicationController
  def new
    @chicken = Chicken.new
  end

  def create
    @chicken = Chicken.new
    if @chicken.save
      redirect_to farms_path(params[:farm_id])
    else
      render :new, :unprocessable_entity
    end
  end
end

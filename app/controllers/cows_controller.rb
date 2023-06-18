class CowsController < ApplicationController
  def new
    @cow = Cow.new
  end

  def create
    @cow = Cow.new
    if @cow.save
      redirect_to farms_path(params[:farm_id])
    else
      render :new, :unprocessable_entity
    end
  end
end

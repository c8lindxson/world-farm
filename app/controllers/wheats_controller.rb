class WheatsController < ApplicationController
  def new
    @wheat = Wheat.new
  end

  def create
    @wheat = Wheat.new
    if @wheat.save
      redirect_to farms_path(params[:farm_id])
    else
      render :new, :unprocessable_entity
    end
  end
end

class TomatoesController < ApplicationController
  def new
    @tomato = Tomato.new
  end

  def create
    @tomato = Tomato.new
    if @tomato.save
      redirect_to farms_path(params[:farm_id])
    else
      render :new, :unprocessable_entity
    end
  end
end

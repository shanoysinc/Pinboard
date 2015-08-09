class PinsController < ApplicationController
  def index
  	@pin  = Pin.all
  end

  def edit
  	@pin = Pin.find(params[:id])
  end

  def show
  	@pin = Pin.find(params[:id])
  end

  def new
  	@pin = Pin.new
  end

  def create 
  	@pin = Pin.new(post_params)
  	if @pin.save
  		redirect_to root_path
    else
      render 'new'
  	end
  end

  def destroy
  	@pin = Pin.find(params[:id])
  	if @pin.destroy 
  		redirect_to root_path
  	end
  end

  def update
  	@pin = Pin.find(params[:id])

  	if @pin.update(params[:pin].permit(:title, :description))
  		redirect_to 'pin/show'
  	end
  end

  private

  def post_params
  	params.require(:pin).permit(:title, :description, :image)
  end
end

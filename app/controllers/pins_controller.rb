class PinsController < ApplicationController

	before_action :require_admin, except: [:index]

	def index
		@pin = Pin.all.order("created_at DESC")
	end

	def new
		@pin = Pin.new
	end

	def create
		@pin = Pin.new (set_pins)
			if @pin.save
				redirect_to pins_path(@Pin)
			else
				render 'new'
			end	
	end

	def show
		@pin = Pin.find(params[:id])
	end

	def edit
		@pin = Pin.find(params[:id])
	end

	def update
		@pin = Pin.find(params[:id])
			if @pin.update(set_pins)
				redirect_to pins_path
			else
				render 'edit'
			end 
	end

	def destroy
		@pin = Pin.find(params[:id])
			@pin.destroy
			redirect_to pins_path
	end


	private
		def set_pins
			params.require(:pin).permit(:name, :image)
		end
	end

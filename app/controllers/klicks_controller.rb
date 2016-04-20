class KlicksController < ApplicationController

	before_action :require_admin, except: [:index]

	def index
		@klick = Klick.all.order("created_at DESC")
	end

	def new
		@klick = Klick.new
	end

	def create
		@klick = Klick.new (set_klicks)
			if @klick.save
				redirect_to klicks_path(@klick)
			else
				render 'new'
			end	
	end

	def show
		@klick = Klick.find(params[:id])
	end

	def edit
		@klick = Klick.find(params[:id])
	end

	def update
		@klick = Klick.find(params[:id])
			if @klick.update(set_klicks)
				redirect_to klicks_path
			else
				render 'edit'
			end 
	end

	def destroy
		@klick = Klick.find(params[:id])
			@klick.destroy
			redirect_to klicks_path
	end


	private
		def set_klicks
			params.require(:klick).permit(:name, :image)
		end
	end

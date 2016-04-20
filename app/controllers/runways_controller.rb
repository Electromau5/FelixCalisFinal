class RunwaysController < ApplicationController

	before_action :require_admin, except: [:index]

	def index
		@runway = Runway.all.order("created_at DESC")
	end

	def new
		@runway = Runway.new
	end

	def create
		@runway = Runway.new (set_runways)
			if @runway.save
				redirect_to runways_path(@runway)
			else
				render 'new'
			end	
	end

	def show
		@runway = Runway.find(params[:id])
	end

	def edit
		@runway = Runway.find(params[:id])
	end

	def update
		@runway = Runway.find(params[:id])
			if @runway.update(set_runways)
				redirect_to runways_path
			else
				render 'edit'
			end 
	end

	def destroy
		@runway = Runway.find(params[:id])
			@runway.destroy
			redirect_to runways_path
	end


	private
		def set_runways
			params.require(:runway).permit(:name, :image)
		end
	end

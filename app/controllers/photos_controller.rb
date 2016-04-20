class PhotosController < ApplicationController

	before_action :require_admin, except: [:index]

	def index
		@photo = Photo.all.order("created_at DESC")
	end

	def new
		@photo = Photo.new
	end

	def create
		@photo = Photo.new (set_photos)
			if @photo.save
				redirect_to photos_path(@photo)
			else
				render 'new'
			end	
	end

	def show
		@photo = Photo.find(params[:id])
	end

	def edit
		@photo = Photo.find(params[:id])
	end

	def update
		@photo = Photo.find(params[:id])
			if @photo.update(set_photos)
				redirect_to photos_path
			else
				render 'edit'
			end 
	end

	def destroy
		@photo = Photo.find(params[:id])
			@photo.destroy
			redirect_to photos_path
	end


	private
		def set_photos
			params.require(:photo).permit(:name, :image)
		end
	end

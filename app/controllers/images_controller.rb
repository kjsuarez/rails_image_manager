class ImagesController < ApplicationController
	def new
		@image = Image.new
	end

	def edit
	end

	def create
		@image = Image.create(image_params)
		redirect_to root_path
		flash[:success]="Image sumbited successfully! Checkout your first image at 'images/1' !"
	end

	def show
		@image = Image.find(params[:id])
	end


	private

	def image_params
		params.require(:image).permit(:avatar)
	end
end

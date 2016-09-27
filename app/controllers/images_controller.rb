class ImagesController < ApplicationController

  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.create(image_params)
    redirect_to "/images/#{@image.id}"
  end

  def show
    @image = Image.find(params[:id])
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    @image.update(image_params)
    flash[:notice] = 'Image successfully updated'
    redirect_to "/images/#{@image.id}"
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    flash[:notice] = 'Image successfully removed'
    redirect_to "/images"
  end

  private

  def image_params
    params.require(:image).permit(:name, :category)
  end

end

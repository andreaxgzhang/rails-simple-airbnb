class FlatsController < ApplicationController
  before_action :set_flat, only: [:edit, :update, :show, :destroy]
  before_action :image_url, only: [:index, :show]
  def index
    @flats = Flat.all
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(set_params)
    if @flat.save
      redirect_to flats_path
    else
      render:new
    end
  end

  def show
    @url = "https://maps.googleapis.com/maps/api/staticmap?center=#{@flat.address}&zoom=14&size=1000x1000"
  end

  def update
    @flat.update(set_params).save
  end

  def destroy
    @flat.destroy
    redirect_to flats_path
  end

  private
  def set_flat
    @flat = Flat.find(params[:id])
  end

  def set_params
    params.require('flat').permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end

  def image_url
    @image = ['https://images.unsplash.com/photo-1494526585095-c41746248156?w=1200', 'https://images.unsplash.com/photo-1493809842364-78817add7ffb?w=1200', 'https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=1200', 'https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=1200', 'https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=1200']
  end
end

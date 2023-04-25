class Api::V1::ListingsController < ApplicationController
  before_action :set_listing, only: [:destroy]

  def index
    @listings = Listing.all
    render json: @listings
  end

  def create
    @listing = Listing.new(listing_params)
    if @listing.save
      render json: @listing, status: :created
    else
      render json: @listing.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @listing.destroy
    head :no_content
  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:user_id, :property_id)
  end
end

class RecyclingSitesController < ApplicationController
  before_action :set_recycling_site, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show new]

  def index
    if params[:material].present?
      @recycling_sites = RecyclingSite.search_by_category(params[:material])
    else
      @recycling_sites = RecyclingSite.all
    end
    @markers = Address.where(addressable_type: "RecyclingSite").geocoded.map do |address|
      @recycling_site = address.addressable
      {
        lat: address.latitude,
        lng: address.longitude,
        # info_window: render_to_string(partial: "info_window", locals: { recycling_site: address.addressable }),
        image_url: helpers.asset_url("https://cdn-icons-png.flaticon.com/512/3299/3299935.png")
      }
    end
  end

  def show
    @petition = Petition.new
    @markers = Address.where(addressable: @recycling_site).geocoded.map do |address|
      {
        lat: address.latitude,
        lng: address.longitude,
        image_url: helpers.asset_url("https://cdn-icons-png.flaticon.com/512/3299/3299935.png")
      }
    end
  end

  def new
    @recycling_site = RecyclingSite.new
    @user = current_user
  end

  def create
    @recycling_site = RecyclingSite.new(recycling_site_params)
    @recycling_site.collector = current_user
    @address = Address.create(address: address_data[:addresses_data][:address], addressable: @recycling_site)
    if @recycling_site.save
      redirect_to "/my_sites"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_recycling_site
    @recycling_site = RecyclingSite.find(params[:id])
  end

  def recycling_site_params
    params.require(:recycling_site).permit(:name, :material_id, :photo, :description)
  end

  def address_data
    params.require(:recycling_site).permit(addresses_data: [:address])
  end
end

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def profile
  end

  def my_petitions
    @markers = Address.where(addressable: @petition).geocoded.map do |address|
      {
        lat: address.latitude,
        lng: address.longitude,
        image_url: helpers.asset_url("https://cdn-icons-png.flaticon.com/512/3299/3299935.png")
      }
    end
  end

  def my_sites
    @recycling_site = RecyclingSite.new
    @recycling_sites = RecyclingSite.where(collector: current_user)
  end


  def petition_my_site
    @my_petitions = Petition.where(recycling_site: current_user)
  end
end

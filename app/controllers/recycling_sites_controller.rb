class RecyclingSitesController < ApplicationController
  def index
    @recycling_sites = RecyclingSite.all
  end
end

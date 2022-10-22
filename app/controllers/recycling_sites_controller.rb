class RecyclingSitesController < ApplicationController
  before_action :set_recycling_site, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @recycling_sites = RecyclingSite.all
  end

  def show
  end

  private

  def set_recycling_site
    @recycling_site = RecyclingSite.find(params[:id])
  end
end

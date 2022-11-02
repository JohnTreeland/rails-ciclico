class RecyclingSitesController < ApplicationController
  before_action :set_recycling_site, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show new]

  def index
    @recycling_sites = RecyclingSite.all
  end

  def show
    @petition = Petition.new
  end

  def new
    @recycling_site = RecyclingSite.new
    @user = current_user
  end

  def create
    @recycling_site = RecyclingSite.new(recycling_site_params)
    @recycling_site.collector = current_user
    if @recycling_site.save
      redirect_to recycling_sites_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_recycling_site
    @recycling_site = RecyclingSite.find(params[:id])
  end

  def recycling_site_params
    params.require(:recycling_site).permit(:name, :material_id)
  end
end

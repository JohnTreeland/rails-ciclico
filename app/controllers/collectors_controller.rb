class CollectorsController < ApplicationController
  before_action :set_collector, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    if params[:city].present?
      @collectors = User.where(city: params[:city])
    else
      @collectors = User.where(collector: true)
    end
  end

  def show
    @petition = Petition.new
  end

  private

  def set_collector
    @collector = User.find(params[:id])
  end

end

class PetitionsController < ApplicationController
  before_action :set_collector, only: %i[create]
  # skip_before_action :authenticate_user!, only: %i[index show new]
  def new
    @petition = Petition.new
  end

  def create
    @petition = Petition.new(petition_params)
    @petition.user = current_user
    @petition.collector = @collector
    @petition.status = "Realizada"
    if @petition.save
      redirect_to collectors_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_collector
    @collector = User.find(params[:collector_id])
  end

  def petition_params
    params.require(:petition).permit(:material_id, :date)
  end
end

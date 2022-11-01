class PetitionsController < ApplicationController
  before_action :set_collector, only: %i[create]
  # skip_before_action :authenticate_user!, only: %i[index show new]
  def new
    @petition = Petition.new
  end

  def create
    @petition = Petition.new(petition_params)
    @petition.user = current_user
    @address = Address.create(address: address_data[:addresses_data][:address], addressable: @petition)
    @petition.collector = @collector
    #@petition.status = 0
    #byebug
    if @petition.save
      redirect_to collectors_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def accept_petition
    @petition = Petition.find(params[:id])
    @petition.status = 1
    if @petition.save
      redirect_to profile_collector_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  def decline_petition
    @petition = Petition.find(params[:id])
    @petition.status = 2
    if @petition.save
      redirect_to profile_collector_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private


  def set_collector
    @collector = User.find(params[:collector_id])
  end

  def petition_params

    params.require(:petition).permit(:material_id, :date, :status)

    params.require(:petition).permit(:material_id, :date)
    # params.require(:petition).permit(:material_id, :date, addresses: [:address])
  end

  def address_data
    params.require(:petition).permit(addresses_data: [:address])

  end
end

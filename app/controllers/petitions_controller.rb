class PetitionsController < ApplicationController
  # before_action :set_collector, only: %i[create]
  # skip_before_action :authenticate_user!, only: %i[index show new]
  def new
    @petition = Petition.new
  end

  def create
    @petition = Petition.new(petition_params)
    @petition.user = current_user
    assign_reference
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
      redirect_to my_petitions_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def decline_petition
    @petition = Petition.find(params[:id])
    @petition.status = 2
    if @petition.save
      redirect_to my_petitions_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def do_petition
    @petition = Petition.find(params[:id])
    @petition.status = 3
    if @petition.save
      redirect_to my_petitions_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_collector
    @collector = User.find(params[:collector_id])
  end

  def set_recycling_site
    @recycling_site = RecyclingSite.find(params[:recycling_site_id])
  end

  def petition_params
    params.require(:petition).permit(:material_id, :date)
    # params.require(:petition).permit(:material_id, :date, addresses: [:address])
  end

  def type_data
    params.require(:petition).permit(:collector_id, :recycling_site_id)
  end

  def address_data
    params.require(:petition).permit(addresses_data: [:address])
  end

  def assign_reference
    if params[:collector_id]
      set_collector
      @address = Address.create(address: address_data[:addresses_data][:address], addressable: @petition) if address_data
      @petition.collector = @collector
    else
      set_recycling_site
      @petition.recycling_site = @recycling_site
    end
  end
end

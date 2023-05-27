class SectorsController < ApplicationController
  before_action :setup_client
  before_action :get_clients, only: [ :new, :create ]

  def index
    @sectors = Sector.find_by(client_id: @client.id)
  end
  

  def new
    @sector = Sector.new
  end

  def create
    @sector = Sector.new(sector_params)
    # binding.irb
    if @sector.save
      redirect_to account_client_path(Current.account, @client), notice: t("flash.message.resource_created", resource: t("models.sector"))
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def sector_params
      params.require(:sector).permit(:name, :phenological_state, :client_id, :crop_id)
    end

    def setup_client
      @client = Client.find(params[:client_id])
    end

    def get_clients
      @crops = Crop.where(account_id: params[:account_id])
    end
end
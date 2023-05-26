class ClientsController < ApplicationController
  before_action :setup_client, only: [:show, :edit, :update, :destroy]

  def index
    @clients = Client.all
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)

    if @client.save
      redirect_to account_client_path(Current.account, @client), notice: t("flash.message.resource_created", resource: t("models.client"))
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @client.update(client_params)
      redirect_to account_client_path(Current.account, @client), notice: t("flash.message.resource_updated", resource: t("models.client"))
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @client.destroy
    redirect_to account_clients_path(Current.account), status: :see_other, alert: t("flash.message.resource_deleted", resource: t("models.client"))
  end

  private
    def client_params
      params.require(:client).permit(:first_name, :last_name, :email, :phone)
    end

    def setup_client
      @client = Client.find(params[:id])
    end
end

# frozen_string_literal: true

# DriverAccountsController
class DriverAccountsController < ApplicationController
  include DriverAccountsHelper
  before_action :set_user
  before_action :set_driver_account, only: [:show, :edit, :update, :destroy]

  # GET users/1/driver_accounts/1
  def show
  end

  # GET users/1/driver_accounts/new
  def new
    if @user.driver_account
      return redirect_to user_driver_account_path(id: @user.id)
    end

    @driver_account = DriverAccount.new(user: @user)
    flash[:now] = 'Despues de crear la cuenta de conductor debes adjuntar
                   los documentos solicitados'
  end

  # POST users/1/driver_accounts
  def create
    @driver_account = DriverAccount.new(user: @user)

    if @driver_account.save
      redirect_to driver_account_legal_documents_path(@driver_account),
                  notice: 'Driver account was successfully created.'
    else
      render action: 'new'
    end
  end

  # DELETE users/1/driver_accounts/1
  def destroy
    @driver_account.destroy

    redirect_to user_driver_accounts_url(@user)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:user_id])
  end

  def set_driver_account
    @driver_account = @user.driver_account
  end
end

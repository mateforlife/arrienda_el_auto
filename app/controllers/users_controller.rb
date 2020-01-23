# frozen_string_literal: true

# UsersController
class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :set_bank_account, only: :show

  def index
    @users = User.all.order(:first_name)
    render '_index'
  end

  def show
  end

  private

  def set_bank_account
    @bank_account = @user.bank_account || BankAccount.new
  end
end

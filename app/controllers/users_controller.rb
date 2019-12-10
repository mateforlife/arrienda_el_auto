# frozen_string_literal: true

# UsersController
class UsersController < ApplicationController
  load_and_authorize_resource
  def index
    @users = User.all
    render '_index'
  end

  def show

  end  
end

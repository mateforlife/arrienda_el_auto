# frozen_string_literal: true

# UsersController
class UsersController < ApplicationController
  load_and_authorize_resource
  def index
    @users = User.all
  end

  def show

  end  
end

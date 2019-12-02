class SearchController < ApplicationController
  def index
    @vehicles = Vehicle.search(params[:search]).available
                       .not_from_current_user(current_user)
                       .preload(:profile_images)
  end
end

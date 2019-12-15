class SearchController < ApplicationController
  def index
    if params[:search].blank?
      redirect_to root_path, notice: 'Empty field'
    else
      @vehicles = Vehicle.search(params[:search]).published
                         .not_from_current_user(current_user)
                         .preload(:profile_images)
    end
  end
end

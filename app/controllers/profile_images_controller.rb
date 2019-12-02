class ProfileImagesController < ApplicationController
  before_action :set_profile_image, only: :destroy
  def destroy
    @profile_image.destroy
    respond_to do |format|
      format.html { redirect_to @vehicle, notice: 'Image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_profile_image
    @profile_image = ProfileImage.find(params[:id])
    @vehicle = @profile_image.resource
  end
end

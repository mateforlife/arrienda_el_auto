# frozen_string_literal: true

# ImagesController
class ImagesController < ApplicationController
  before_action :set_image, only: :destroy
  def destroy
    @image.purge_later
    respond_to do |format|
      format.js { flash[:now] = 'Imagen destruida' }
    end
  end

  private

  def set_image
    @image = ActiveStorage::Attachment.find(params[:id])
  end
end

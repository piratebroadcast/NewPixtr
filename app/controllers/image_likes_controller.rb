class ImageLikesController < ApplicationController
  def create
    image = find_image
    current_user.like image
    redirect_to image
  end

  def destroy
    image = find_image
    current_user.unlike image
    redirect_to image
  end

  private

  def find_image
    Image.find(params[:id])
  end
end

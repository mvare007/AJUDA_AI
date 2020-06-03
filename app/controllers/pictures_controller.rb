class PicturesController < ApplicationController
  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to edit_request_path(@picture.request)
  end
end

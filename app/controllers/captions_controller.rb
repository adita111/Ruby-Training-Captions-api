class CaptionsController < ApplicationController
  skip_forgery_protection
  def index
    caption = Caption.all
    render json: caption
  end

  def show
    caption = Caption.find(params[:id])
    render json: caption
  end

  def create
    caption = CaptionService.create(caption_params)

    render json: caption, status: :created
  end

  def destroy
    CaptionService.destroy(params[:id])

    head :no_content
  end

  private

  def caption_params
    params.require(:caption).permit(:source_url, :text, :image_path)
  end

end

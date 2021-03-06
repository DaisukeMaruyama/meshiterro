class PostImagesController < ApplicationController

  def new
    @post_image = PostImage.new
  end

  def index
    @post_images = PostImage.all.order(created_at: :desc).page(params[:page]).per(5)
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
  end

  def create
    @post_image = PostImage.create(post_image_params)
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_images_path
  end

  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to post_images_path
  end

  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end

end

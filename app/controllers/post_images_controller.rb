class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new #PostImageモデルの中に新しいものオブジェクトを作成する。
  end

  # 投稿データの保存
  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_images_path
  end

  def index
    @post_images = PostImage.all #post_imagesテーブルからPostImageモデルの全てのデータを取りだす
  end

  def show
  end

  def destroy
  end

  # 投稿データのストロングパラメータ
  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
end

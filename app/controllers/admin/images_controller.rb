class Admin::ImagesController < AdminController

  before_action :find_image

  def edit
  end

  def update
    if @admin_image.update(image_params)
      redirect_back(fallback_location: request.referrer)
      flash[:notice] = '更新成功'
    else
      flash[:alert] = '更新失敗'
      render :system
    end
  end


  private

  def find_image
    @admin_image = Admin::Image.find_by(id: params[:id])
  end

  def image_params
    params.require(:admin_image).permit(:src, :alt)
  end
end
class Admin::ContentsController < AdminController
  before_action :find_content, only: [:edit, :update, :destroy]

  def edit
    @admin_content.build_image unless @admin_content.image
  end

  def update
    if @admin_content.update(content_params)
      redirect_back(fallback_location: request.referrer)
      flash[:notice] = '更新成功'
    else
      flash[:alert] = '更新失敗'
      render :edit
    end
  end

  def destroy
    @admin_content.destroy
    redirect_back(fallback_location: request.referrer)
    flash[:notice] = '更新成功'
  end

  private

  def find_content
    @admin_content = Admin::Content.find_by(id: params[:id])
  end

  def content_params
    params.require(:admin_content).permit(:title, :description,
                                            :title_zh_tw, :description_zh_tw,
                                            :title_en, :description_en,
                                            :title_zh_cn, :description_zh_cn,
                                            image_attributes: [:src, :alt])
  end
end

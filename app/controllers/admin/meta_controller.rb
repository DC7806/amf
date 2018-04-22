class Admin::MetaController < AdminController

  before_action :find_metum, only: [:edit, :update]
  
  def index
    @admin_meta = Admin::Metum.order(page: :asc)
  end

  def edit
  end

  def update
    if @admin_metum.update(metum_params)
      redirect_to admin_meta_path, notice: '更新成功'
    else
      flash[:alert] = '更新失敗'
      render :edit
    end
  end

  private

  def find_metum
    @admin_metum = Admin::Metum.find_by(id: params[:id])
  end

  def metum_params
    params.require(:admin_metum).permit(:page, :title, :description, :og_image,
                                        :title_zh_tw, :description_zh_tw, :og_title_zh_tw, :og_description_zh_tw,
                                        :title_en, :description_en, :og_title_en, :og_description_en,
                                        :title_zh_cn, :description_zh_cn, :og_title_zh_cn, :og_description_zh_cn,)
  end

end
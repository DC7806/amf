class Admin::TranslationsController < AdminController

  def index
    if params[:query]
      @admin_translations = Admin::Translation.search(params[:query]).order(key: :asc)
      params[:query] = nil
    else
      @admin_translations = Admin::Translation.order(key: :asc)
    end
  end

  def new
    @admin_translation = Admin::Translation.new
  end

  def create
    @admin_translation = Admin::Translation.new(translation_params)
    if @admin_translation.save
      redirect_to admin_translations_path, notice: '新增成功'
    else
      render :new
      flash[:notice] = '新增失敗'
    end
  end

  def update_all
    params['admin_translation'].each do |id|
      admin_translation = Admin::Translation.find(id.to_i)
      admin_translation.update(update_translation_params(id))
    end
    redirect_back(fallback_location: request.referrer)
    flash[:notice] = '更新成功'
  end

  private

  def translation_params
    params.require(:admin_translation).permit(:key, :tw, :cn, :en)
  end

  def update_translation_params id
    params.require(:admin_translation).fetch(id).permit(:tw, :cn, :en)
  end
  
end
class Admin::TranslationsController < AdminController

  def index
    if params[:query]
      @admin_translations = Admin::Translation.search(params[:query]).order(key: :asc)
      params[:query] = nil
    else
      @admin_translations = Admin::Translation.order(key: :asc)
    end
  end

  def update_all
    params['admin_translation'].each do |id|
      admin_translation = Admin::Translation.find(id.to_i)
      admin_translation.update(translation_params(id))
    end
    redirect_back(fallback_location: request.referrer)
    flash[:notice] = '更新成功'
  end

  private

  def translation_params id
    params.require(:admin_translation).fetch(id).permit(:tw, :cn, :en)
  end
  
end
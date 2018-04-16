class Admin::StaticContentsController < AdminController
  
  def about
    if params[:about]
      update_content('about')
    else
      @about = find_static_contents('about')
    end
  end

  private

  def find_static_contents file_name
    YAML::load_file("#{Rails.root}/yamls/#{file_name}.yml")
  end

  def update_content file_name
    src = YAML::load_file("#{Rails.root}/yamls/#{file_name}.yml")
    data = params[file_name.to_sym]
    data.each do |k1, v1|
      v1.each do |k2, v2|
        src[k1][k2] = v2
      end
    end
    File.write("#{Rails.root}/yamls/#{file_name}.yml", src.to_yaml)
    redirect_back(fallback_location: request.referrer)
    flash[:notice] = '更新成功'
  end

end
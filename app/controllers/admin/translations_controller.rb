class Admin::TranslationsController < AdminController

  def index
    en = YAML::load_file("#{Rails.root}/config/locales/en.yml")
    tw = YAML::load_file("#{Rails.root}/config/locales/zh-TW.yml")
    cn = YAML::load_file("#{Rails.root}/config/locales/zh-CN.yml")
    @total = [en, tw, cn].reduce(&:merge)
    @en = en
  end

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

  def deep_find(obj, key)
    # The base case for our recursive method. Returns if the key is found.
    return obj[key] if obj.respond_to?(:key?) && obj.key?(key)

    # If the object is either a Hash or Array
    if obj.is_a? Enumerable
      found = nil
      # Use the Enumerable#find to return the first object
      # for which the block returns true. Sets the found
      # variable to the result of calling #deep_find again.
      # With this recursive call, we pass in the last nested hash
      # of the current level of nesting as our object. This is
      # essentially a depth first search.
      obj.find { |*a| found = deep_find(a.last, key) }

      # return the value of the key
      found
    end
  end

  def deep_find(obj, key, nested_key: nil)
    return obj[key] if obj.respond_to?(:key?) && obj.key?(key)
    if obj.is_a? Enumerable
      found = nil
      obj.find { |*a| found = deep_find(a.last, key) }
      if nested_key.present?
        deep_find(found, nested_key)
      else
        found
      end
    end
  end


end
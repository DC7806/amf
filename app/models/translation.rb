class Translation < ApplicationRecord

  after_save :write_to_yaml

  def self.search(query)
    where("key LIKE ? OR tw LIKE ? OR cn LIKE ? OR en LIKE ?", 
          "%#{query.downcase}%", "%#{query.downcase}%", "%#{query.downcase}%", "%#{query.downcase}%")
    # where(key: query.downcase)
  end

  private

  def write_to_yaml
    {'zh-TW': 'tw', 'zh-CN': 'cn', 'en': 'en'}.each do |file_name, lang|
      #open file
      src = YAML::load_file("#{Rails.root}/config/locales/#{file_name}.yml")
      src_frontend = src.dig(file_name.to_s)
      # assign values
      Translation.all.each do |trans|
        key_chain = trans.key.split('.')
        src_frontend[key_chain[0]][key_chain[1]][key_chain[2]] = trans.send(lang)
      end
      # write to files
      File.write("#{Rails.root}/config/locales/#{file_name}.yml", src.to_yaml)
    end
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
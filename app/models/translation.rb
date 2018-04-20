class Translation < ApplicationRecord

  after_update :write_to_yaml

  def self.search(query)
    where("key LIKE ? OR tw LIKE ? OR cn LIKE ? OR en LIKE ?", 
          "%#{query.downcase}%", "%#{query.downcase}%", "%#{query.downcase}%", "%#{query.downcase}%")
  end

  private

  def write_to_yaml
    {'zh-TW': 'tw', 'zh-CN': 'cn', 'en': 'en'}.each do |file_name, lang|
      group = Translation.all.map do |trans|
                key_to_array = trans.key.split('.').unshift(file_name.to_s)
                key_to_array.reverse.inject(trans.send(lang)) { |v, k| { k => v } }
              end.reduce(&:deep_merge)
      File.write("#{Rails.root}/config/locales/#{file_name}.yml", group.to_yaml)
    end
  end

  #  def write_to_yaml
  #   {'zh-TW': 'tw', 'zh-CN': 'cn', 'en': 'en'}.each do |file_name, lang|
  #     #open file
  #     src = YAML::load_file("#{Rails.root}/config/locales/#{file_name}.yml")
  #     src_frontend = src.dig(file_name.to_s)
  #     # assign values
  #     Translation.all.each do |trans|
  #       key_chain = trans.key.split('.')
  #       src_frontend[key_chain[0]][key_chain[1]][key_chain[2]] = trans.send(lang)
  #     end
  #     # write to files
  #     File.write("#{Rails.root}/config/locales/#{file_name}.yml", src.to_yaml)
  #   end
  # end


end
class ChangeTranlationsColumnNames < ActiveRecord::Migration[5.1]
  def change
    rename_column :translations, :"zh-TW", :tw
    rename_column :translations, :"zh-CN", :cn
  end
end

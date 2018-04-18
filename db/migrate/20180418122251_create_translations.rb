class CreateTranslations < ActiveRecord::Migration[5.1]
  def change
    create_table :translations do |t|
      t.string :key
      t.string :"zh-TW"
      t.string :"zh-CN"
      t.string :en

      t.timestamps
    end
  end
end

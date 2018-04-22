class CreateMeta < ActiveRecord::Migration[5.1]
  def change
    create_table :meta do |t|
      t.string :page
      t.string :title
      t.text :description
      t.string :og_title
      t.text :og_description
      t.text :og_image
      t.references :metumble, polymorphic: true

      t.timestamps
    end
  end
end

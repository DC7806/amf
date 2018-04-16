class CreateContents < ActiveRecord::Migration[5.1]
  def change
    create_table :contents do |t|
      t.string :page
      t.string :section
      t.string :title
      t.text :description
      t.references :contentable, polymorphic: true

      t.timestamps
    end
  end
end

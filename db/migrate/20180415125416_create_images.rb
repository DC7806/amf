class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :lang
      t.string :src
      t.string :alt
      t.integer :sort
      t.references :imageable, polymorphic: true

      t.timestamps
    end
  end
end

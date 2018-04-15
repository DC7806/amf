class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.text :description
      t.integer :sort

      t.timestamps
    end
  end
end

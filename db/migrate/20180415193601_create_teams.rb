class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.text :description
      t.integer :sort

      t.timestamps
    end
  end
end

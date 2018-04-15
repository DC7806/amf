class CreatePortfolios < ActiveRecord::Migration[5.1]
  def change
    create_table :portfolios do |t|
      t.string :title
      t.text :description
      t.string :video_src
      t.string :permalink
      t.integer :sort

      t.timestamps
    end
  end
end

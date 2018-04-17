class AddPageAndSectionToImages < ActiveRecord::Migration[5.1]
  def change
    add_column :images, :page, :string
    add_column :images, :section, :string
  end
end

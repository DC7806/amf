class CreateInquiries < ActiveRecord::Migration[5.1]
  def change
    create_table :inquiries do |t|
      t.string :prefix
      t.string :first_name
      t.string :last_name
      t.string :number
      t.string :email
      t.text :message

      t.timestamps
    end
  end
end

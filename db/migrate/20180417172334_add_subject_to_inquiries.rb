class AddSubjectToInquiries < ActiveRecord::Migration[5.1]
  def change
    add_column :inquiries, :subject, :string
  end
end

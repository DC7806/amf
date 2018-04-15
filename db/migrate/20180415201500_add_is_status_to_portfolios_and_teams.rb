class AddIsStatusToPortfoliosAndTeams < ActiveRecord::Migration[5.1]
  def change
    add_column :portfolios, :is_publish, :boolean, default: false
    add_column :portfolios, :is_highlight, :boolean, default: false
    add_column :teams, :is_publish, :boolean, default: false
    add_column :clients, :is_publish, :boolean, default: false
  end
end

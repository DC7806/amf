module AdminSortable
  
  extend ActiveSupport::Concern

  included do

    include RailsSortable::Model
    set_sortable :sort, without_updating_timestamps: true

  end
end
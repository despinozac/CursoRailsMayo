class AddTimestampsToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :created_at, :datetime
    add_column :profiles, :updated_at, :datetime
  end
end

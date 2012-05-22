class AddTimesToRelation < ActiveRecord::Migration
  def change
    add_column :relations, :times, :integer
  end
end

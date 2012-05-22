class CreateRelations < ActiveRecord::Migration
  def self.up
    create_table :relations do |t|
      t.string :word
      t.integer :worker_id
      t.integer :document_id
      t.timestamps
    end
  end

  def self.down
    drop_table :relations
  end
end

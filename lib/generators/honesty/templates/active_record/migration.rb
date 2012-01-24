class HonestyMigration < ActiveRecord::Migration
  def self.up
    create_table :honesty do |t|
      t.string  :context
      t.string  :agent
      t.text    :action
      t.timestamps
    end
  end

  def self.down
    drop_table :honesty
  end
end
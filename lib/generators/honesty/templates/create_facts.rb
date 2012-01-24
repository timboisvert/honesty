class CreateFacts < ActiveRecord::Migration
  def self.up
    create_table :facts do |t|
      t.string :context, :limit => 40 
      t.string :agent
      t.string :action
      t.references :honest, :polymorphic => true
      t.timestamps
    end

    add_index :facts, :honest_type
    add_index :facts, :honest_id
  end

  def self.down
    drop_table :facts
  end
end

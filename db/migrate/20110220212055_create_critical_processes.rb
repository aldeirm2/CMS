class CreateCriticalProcesses < ActiveRecord::Migration
  def self.up
    create_table :critical_processes do |t|
      t.integer :cp_secondary_id
      t.string :cp_title
      t.text :cp_intro
      t.text :cp_definition
      t.text :in_scope
      t.text :out_scope

      t.timestamps
    end
  end

  def self.down
    drop_table :critical_processes
  end
end

class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.string :name
      t.integer :critical_process_id
      t.boolean :edit
      t.boolean :review

      t.timestamps
    end
  end

  def self.down
    drop_table :roles
  end
end

class AddAdminToRole < ActiveRecord::Migration
  def self.up
    add_column :roles, :admin, :boolean
  end

  def self.down
    remove_column :roles, :admin
  end
end

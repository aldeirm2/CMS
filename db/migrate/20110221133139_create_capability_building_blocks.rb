class CreateCapabilityBuildingBlocks < ActiveRecord::Migration
  def self.up
    create_table :capability_building_blocks do |t|
      t.string :cbb_title
      t.text :cbb_definition
      t.integer :category_id
      t.text :level_1_cbb
      t.text :level_2_cbb
      t.text :level_3_cbb
      t.text :level_4_cbb
      t.text :level_5_cbb

      t.timestamps
    end
  end

  def self.down
    drop_table :capability_building_blocks
  end
end

class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :category_title
      t.integer :critical_process_id
      t.text :level_1_category
      t.text :level_2_category
      t.text :level_3_category
      t.text :level_4_category
      t.text :level_5_category

      t.timestamps
    end
  end

  def self.down
    drop_table :categories
  end
end

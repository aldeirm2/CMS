class CreateKeyTerms < ActiveRecord::Migration
  def self.up
    create_table :key_terms do |t|
      t.string :term
      t.text :meaning

      t.timestamps
    end
  end

  def self.down
    drop_table :key_terms
  end
end

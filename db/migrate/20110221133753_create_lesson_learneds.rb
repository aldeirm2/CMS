class CreateLessonLearneds < ActiveRecord::Migration
  def self.up
    create_table :lesson_learneds do |t|
      t.string :lesson_learned_title
      t.text :lesson_learned_definition
      t.integer :critical_process_id

      t.timestamps
    end
  end

  def self.down
    drop_table :lesson_learneds
  end
end

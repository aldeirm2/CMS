class RenameLessonLearnedToLesson < ActiveRecord::Migration
  def self.up
    rename_column :lesson_learneds, :lesson_learned_title, :lesson_title
    rename_column :lesson_learneds, :lesson_learned_definition, :lesson_definition
    rename_table :lesson_learneds, :lessons

  end

  def self.down
    rename_table :lessons, :lesson_learneds
    rename_column :lesson_learneds, :lesson_title,  :lesson_learned_title
    rename_column :lesson_learneds, :lesson_definition, :lesson_learned_definition
  end
end



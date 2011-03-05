class CreateCriticalProcessesKeyTermsJoin < ActiveRecord::Migration
  def self.up
    create_table "critical_processes_key_terms", :id => false do |t|
      t.integer :critical_process_id
      t.integer :key_term_id
    end
  end

  def self.down
    drop_table 'critical_processes_key_terms'
  end
end

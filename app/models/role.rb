class Role < ActiveRecord::Base

  belongs_to :critical_process
  has_and_belongs_to_many :users


  def critical_processes
    self.critical_process.collect{ |x| CriticalProcess.where(:cp_secondary_id => x.critical_process_id) }.flatten.uniq
  end

end

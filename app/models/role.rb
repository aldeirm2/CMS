class Role < ActiveRecord::Base

  belongs_to :critical_process
  has_and_belongs_to_many :users

end

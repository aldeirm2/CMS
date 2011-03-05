class Category < ActiveRecord::Base
  belongs_to :critical_process
  has_many :capability_building_blocks, :dependent => :destroy
  accepts_nested_attributes_for :capability_building_blocks, :reject_if => lambda { |a| a[:cbb_title].blank? }, :allow_destroy => true
end

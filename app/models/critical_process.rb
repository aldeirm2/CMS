class CriticalProcess < ActiveRecord::Base
  has_many :categories, :dependent => :destroy
  has_many :lessons, :dependent => :destroy
  has_many :roles, :dependent => :destroy, :primary_key => :cp_secondary_id
  has_and_belongs_to_many :key_terms
  accepts_nested_attributes_for :categories, :reject_if => lambda { |a| a[:category_title].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :lessons, :reject_if => lambda { |a| a[:lesson_title].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :key_terms, :reject_if => lambda {|a| a[:term].blank? }

  after_create :new_cp
  # method which is called everything a new critical process is created to create the 2 new roles for that new CP
  def create_roles
    Role.create :name => "#{self.cp_title} edit", :critical_process_id => self.id, :edit => true, :review => false
    Role.create :name => "#{self.cp_title} review", :critical_process_id => self.id, :edit => false, :review => true
  end

  def set_secondary_id
      self.update_attribute :cp_secondary_id, self.id
  end

  def new_cp
    if self.cp_secondary_id.blank?
      set_secondary_id
      create_roles
    end
  end

  # method to retrieve all key terms that are no assigned to a CP
  def unassigned_key_terms
    KeyTerm.find(:all) - self.key_terms
  end

  # method to check if a key term already belongs to a critical process.
  def has_key_term(key_term)
    self.key_terms.include?(key_term)
  end
end

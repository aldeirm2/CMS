class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  has_and_belongs_to_many :roles_as_reviewer, :join_table => 'roles_users', :conditions => {:review => true}
  has_and_belongs_to_many :roles_as_editor, :join_table => 'roles_users', :conditions => {:edit => true}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role_ids

  def cp_as_editor
    self.roles_as_editor.collect{ |x| CriticalProcess.where(:cp_secondary_id => x.critical_process_id) }.flatten.uniq
  end

  def cp_as_reviewer
    self.roles_as_editor.collect{ |x| CriticalProcess.where(:cp_secondary_id => x.critical_process_id) }.flatten.uniq
  end

  def roles
      self.roles_as_editor + self.roles_as_reviewer
  end
end

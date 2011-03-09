class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  has_and_belongs_to_many :roles_as_reviewer, :class_name => "Role", :join_table => 'roles_users', :conditions => {:review => true}
  has_and_belongs_to_many :roles_as_editor, :class_name => "Role", :join_table => 'roles_users', :conditions => {:edit => true}
  has_and_belongs_to_many :role_as_admin, :class_name => 'Role', :join_table => 'roles_users', :conditions => {:admin => true}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :roles_as_reviewer_ids, :roles_as_editor_ids, :role_as_admin_ids

  def cps_as_editor
    self.roles_as_editor.collect{ |x| CriticalProcess.where(:cp_secondary_id => x.critical_process_id) }.flatten.uniq
  end

  def cps_as_reviewer
    self.roles_as_editor.collect{ |x| CriticalProcess.where(:cp_secondary_id => x.critical_process_id) }.flatten.uniq
  end


  def roles
      roles_as_editor + roles_as_reviewer + role_as_admin
  end

  def is_admin
    if self.role_as_admin.size > 0
      return true
    else
      return false
    end
  end

  def can_edit?(cp)
    self.roles.exists?(:id => cp.role_ids)
  end
end

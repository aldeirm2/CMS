class Ability
  include CanCan::Ability

  def initialize(user)

     can :manage, CriticalProcess do |critical_process|
        user.cps_as_editor.include?(critical_process)
     end

    if user.is_admin
      can :manage, :all
    else
      can :read, CriticalProcess
    end

  end
end
class Ability
  include CanCan::Ability

 def initialize(user)
   user ||= User.new #guest user
   can :read, :all
   can :picture, Hrholder #allow guests to view hr holder pictures.
   if user.role? "admin"
     can :manage, :all
		 can :upload, :csv
		 can :import, :csv
   elsif user.role? "manager"
     can [:update, :create, :read ], :all
   elsif user.role? "managerassist"
     can [:update, :read, :create], [Make, Department, Category, Model, Kit, Location, Item, HandReceipt, State, MakeCategory ]
     can :read, [Profile, Role, UserHasRole]
   end
 end
end


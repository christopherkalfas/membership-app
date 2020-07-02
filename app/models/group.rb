class Group < ApplicationRecord
    has_many :memberships
    has_many :users, through: :memberships
    belongs_to :owner, class_name: 'User', foreign_key: :owner_id
    has_many :invites



   def non_group_memberships 
    Membership.all.select {|mem| mem.group_id != self.id}
   end

   def non_group_users
    non_group_memberships.collect {|mem| mem.user.name}
   end 

    

 
end

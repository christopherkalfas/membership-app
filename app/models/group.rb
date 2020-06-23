class Group < ApplicationRecord
    has_many :memberships
    has_many :users, through: :memberships
    belongs_to :owner, class_name: 'User', foreign_key: :owner_id

    def memberships
        Membership.all.select {|membership| membership.group == self}
    end 

    def users 
        memberships.collect {|membership| membership.user}
    end 

 
end

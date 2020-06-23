class User < ApplicationRecord
    has_many :memberships
    has_many :groups, through: :memberships
    has_many :owned_groups, foreign_key: 'owner_id', class_name: 'Group'

    has_secure_password

  
    validates_uniqueness_of :email

    def memberships 
        Membership.all.select {|membership| membership.user == self}
    end 

    def groups 
        memberships.collect {|membership| membership.group}
    end 
end

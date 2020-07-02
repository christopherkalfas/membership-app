class User < ApplicationRecord
    has_many :memberships
    has_many :groups, through: :memberships
    has_many :owned_groups, foreign_key: 'owner_id', class_name: 'Group'
    belongs_to :invite
    has_many :sent_invites, :class_name => "Invite", :foreign_key => 'sender_id'

    has_secure_password

  
    validates_uniqueness_of :email

    before_create :set_invitation_limit

    def invitation_token
        invite.token if invite
    end
      
    def invitation_token=(token)
        self.invite = Invite.find_by_token(token)
    end
    
    private

    def set_invitation_limit
        self.invitation_limit = 50
    end
end

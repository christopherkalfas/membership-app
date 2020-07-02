class Invite < ApplicationRecord
  belongs_to :group
  belongs_to :sender, :class_name => 'User'
  has_one :recipient, :class_name => 'User'


  before_create :generate_token
  before_create :decrement_sender_count, :if => :sender 

  private

  def sender_has_invitations
    unless sender.invitation_limit > 0
      errors.add_to_base 'You have reached your limit of invitations to send.'
    end
  end

  def generate_token
    self.token = Digest::SHA1.hexdigest([Time.now, rand].join)
  end
  def decrement_sender_count
    sender.decrement! :invitation_limit
  end
end

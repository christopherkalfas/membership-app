class Mailer < ActionMailer::Base
    def invite(invite, signup_url)
      subject    'invite'
      recipients invite.recipient_email
      from       'foo@example.com'
      body       :invite => invite, :signup_url => signup_url
      invite.update_attribute(:sent_at, Time.now)
    end
  end
# Preview all emails at http://localhost:3000/rails/mailers/mailer_mailer
class MailerMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/mailer_mailer/invitation
  def invitation
    MailerMailer.invitation
  end

end

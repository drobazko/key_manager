class CredentialMailer < ActionMailer::Base
  default from: ActionMailer::Base.smtp_settings[:user_name]

  def out_of_date(credential)
    @credential = credential
    @user = @credential.user
    mail(
      :to      => @user.email,
      :subject => 'Password entity is out of date'
    )
  end

  def master_key(user, master_key)
    @master_key = master_key
    mail(
      :to      => user.email,
      :subject => 'Your master key'
    )
  end  
end

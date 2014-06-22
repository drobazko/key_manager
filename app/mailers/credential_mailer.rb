class CredentialMailer < ActionMailer::Base
	default from: "info@stockox.com"

	def out_of_date(credential)
		@credential = credential
		@user = @credential.user
	    mail(
	      :to      => @user.email,
	      :subject => 'Password entity is out of date'
	    )
	end 	
end 
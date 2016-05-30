# Preview all emails at http://localhost:3000/rails/mailers/compp_mailer
class ComppMailerPreview < ActionMailer::Preview

	def sample_mail_preview
    	ComppMailer.sample_email(User.first)
  	end
end


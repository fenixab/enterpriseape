ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
	:address			  => 'smtp.sendgrid.net',
	:port 				  =>   587,
	:authentication 	  => :plain,
	:user_name			  => 'app80285831@heroku.com',
	:password			  => '2n6xfntz8906',
	:domain				  => 'heroku.com',
	:enable_starttls_auto => true
}


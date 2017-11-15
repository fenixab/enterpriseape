ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
	:address			  => 'smtp.gmail.com',
	:port 				  =>   587,
	:authentication 	  => :plain,
	:user_name			  => 'wificamla@gmail.com',
	:password			  => 'ab12081000',
	:enable_starttls_auto => true
}


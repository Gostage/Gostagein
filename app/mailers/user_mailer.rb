class UserMailer < ApplicationMailer
	default from: 'contact@les-psychodingues.fr'

	def welcome_email(user)
    	@user = user 
    	@url  = 'https://go-in-stage.herokuapp.com/' 
    	mail(to: @user.email, subject: 'Bienvenue sur le site Go in stage !') 
    end
end

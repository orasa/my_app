module SessionsHelper

	#we create function in this module so it can be use in controllers
	#and views

	def sign_in(user)
		cookies.permanent.signed[:remember_token] = [user.id, user.salt]
		self.current_user = user
	end

	# cookies.delete take ()
	def sign_out
		cookies.delete(:remember_token)
		self.current_user = nil
	end	
		
		#this is a method(with one agument) for handle assignment 
		#to current_user, it @current_user variable store user to be
		#used later
	def current_user=(user)
		@current_user = user
	end	

       #this set teh @current_user to the user
       #corresponding to the remember token
       #but only if @current_user is undefined
       #therefore, it calls the user_from_remember_token method
       #the first time the current_user is called
       #but on subsequent invocation returns @current_user without calling
       #user_from_remember_token
	def current_user
		@current_user ||= user_from_remember_token
	end


	#a user is signed in if current_user is not nil ! is "not" operator
	def signed_in?
		!current_user.nil?
	end	
	
	private
	
		def user_from_remember_token
			User.authenticate_with_salt(*remember_token)
		end
		
		def remember_token
			cookies.signed[:remember_token] || [nil, nil]
		end		
end

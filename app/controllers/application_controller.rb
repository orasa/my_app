class ApplicationController < ActionController::Base
  
  #packaging fuctions together and includeing them in multiple places
  #the Session helper moduls contains functions for authentication.
  #to be use both in controllers and views
  #We can make a new module for authentication
  #but the Sessions controller comes with the module, SessionsHelper
  #Helpers are autometically in Views by default
  #We only need to include in Application controller
  #so the controller can access it too
  protect_from_forgery
  include SessionsHelper
end

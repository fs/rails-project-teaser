class ApplicationController < ActionController::Base

     helper :all # include all helpers, all the time

     protect_from_forgery # :secret => '4de6f338319f4d74b2f67e4411ad3a9a'
   
     # layout & protect_from_forgery - in this
#    include Flatsoft::Base
    include Flatsoft::AuthenticatedSystem
    include Flatsoft::AclSystem
    include Flatsoft::RescueSystem    

  
end

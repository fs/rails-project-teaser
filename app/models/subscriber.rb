class Subscriber < ActiveRecord::Base

    validates_presence_of  :email, :ip, :user_agent

    validates_format_of :email, :with => ActiveProject::RailsExt::RegexpFormat::EMAIL
    validates_uniqueness_of :email

end

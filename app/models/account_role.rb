# == Schema Information
# Schema version: 20080611125523
#
# Table name: account_roles
#
#  id         :integer         not null, primary key
#  title      :string(255)     
#  deleted_at :datetime        
#  created_at :datetime        
#  updated_at :datetime        
#

class AccountRole < ActiveRecord::Base

    acts_as_acl :role

    # default order 
    named_scope :recent, :order => 'UPDATED_AT DESC'
    named_scope :active, { :conditions => "deleted_at is null" }

    validates_length_of :title, :maximum => 255

end 



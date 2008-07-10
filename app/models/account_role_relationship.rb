# == Schema Information
# Schema version: 20080611125523
#
# Table name: account_role_relationships
#
#  id              :integer         not null, primary key
#  account_id      :integer         
#  account_role_id :integer         
#  deleted_at      :datetime        
#  created_at      :datetime        
#  updated_at      :datetime        
#

class AccountRoleRelationship < ActiveRecord::Base

    acts_as_acl :relationship
    
end

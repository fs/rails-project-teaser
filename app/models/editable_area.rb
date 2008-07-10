# == Schema Information
# Schema version: 20080611125523
#
# Table name: editable_areas
#
#  id          :integer         not null, primary key
#  name        :string(255)     
#  html        :text            
#  description :text            
#  deleted_at  :datetime        
#  created_at  :datetime        
#  updated_at  :datetime        
#

class EditableArea < ActiveRecord::Base

    attr_protected :name

    validates_uniqueness_of :name
    validates_presence_of   :name, :html
    validates_format_of     :name,
        :with => /^[\w\d\_\-\.]+$/

    validates_length_of     :name,          :maximum => 255
    validates_length_of     :html,          :maximum => 65535
    validates_length_of     :description,   :maximum => 65535

    # default order 
    named_scope :recent, :order => 'UPDATED_AT DESC'
    named_scope :limit,  lambda { |length|  { :limit => length }  }
end

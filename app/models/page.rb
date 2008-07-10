# == Schema Information
# Schema version: 20080611125523
#
# Table name: pages
#
#  id               :integer         not null, primary key
#  url              :string(255)     
#  name             :string(255)     
#  title            :string(255)     
#  text             :text            
#  meta_keywords    :text            
#  meta_description :text            
#  created_at       :datetime        
#  updated_at       :datetime        
#  deleted_at       :datetime        
#

class Page < ActiveRecord::Base

    validates_presence_of   :text, :url, :name

    validates_length_of     :text, :in => 0..65535

    validates_length_of     :url,   :maximum => 255
    validates_length_of     :name,  :maximum => 255
    validates_length_of     :title, :maximum => 255, :allow_blank => true

    validates_length_of     :meta_keywords,     :maximum => 65535, :allow_blank => true
    validates_length_of     :meta_description,  :maximum => 65535, :allow_blank => true

    validates_uniqueness_of :url

    validates_format_of :url, :with => /^[\w\d\_\-\/]+$/

        # should be a default order for all elements
    named_scope :recent, :order => 'UPDATED_AT DESC'
    named_scope :limit,  lambda { |length|  { :limit => length }  }
    named_scope :active, { :conditions => "deleted_at is null" }

    public

    def meta_data
        returning Hash.new do |result|
            %w{keywords description}.each do |name|
                result[name] = send("meta_#{name}") unless send("meta_#{name}").blank?
            end
        end
    end

    def delete(time = Time.now.to_s(:db))
        self.update_attribute(:deleted_at, time)
    end

    def undelete
        self.update_attribute(:deleted_at, nil)
    end

end

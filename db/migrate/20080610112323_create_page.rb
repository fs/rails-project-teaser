class CreatePage < ActiveRecord::Migration

    DEFAULT_PAGES = {
        'About us'          => 'about',
        'Contact us'        => 'contact',
        'Terms & Conditions'=> 'terms',
        'Privacy policy'    => 'privacy',
        'Pricing'           => 'pricing'
    }

    
    def self.up
        create_table :pages do |t|
            t.string    :url,:name, :title
            t.text      :text
            t.text      :meta_keywords, :meta_description
            t.timestamps            
            t.datetime  :deleted_at
        end

        DEFAULT_PAGES.each do |name, url|
            Page.create(
                :name => name,
                :url  => url,
                :text => 'Please Insert content here'
            )
        end
    end

    def self.down
        drop_table :pages
    end
end

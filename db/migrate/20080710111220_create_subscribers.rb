class CreateSubscribers < ActiveRecord::Migration
    def self.up
        create_table :subscribers do |t|
            t.string :email
            t.string :ip
            t.string :user_agent
            t.string :referrer

            t.timestamps
        end
    end

    def self.down
        drop_table :subscribers
    end
end

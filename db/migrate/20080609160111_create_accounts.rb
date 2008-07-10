class CreateAccounts < ActiveRecord::Migration
    def self.up
        create_table "accounts", :force => true do |t|
            t.string :login, :email, :remember_token
            t.string :crypted_password, :salt, :limit => 40
            t.string :state, :null => :no
            t.datetime :remember_token_expires_at, :deleted_at
            t.timestamps
        end

        ActiveRecord::Base.connection.execute("INSERT INTO `accounts`(`login`, `email`, `salt`, `crypted_password`, `state`, `created_at`, `updated_at`) VALUES('admin', 'support@flatsourcing.com', '7e3041ebc2fc05a40c60028e2c4901a81035d3cd', '259e1105c5b20f39e838f12a816b9462eda07231', 'active', '#{Time.now.to_s(:db)}','#{Time.now.to_s(:db)}')")
    end

    def self.down
        drop_table :accounts
    end
end

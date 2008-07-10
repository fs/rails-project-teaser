class CreateAccountRoles < ActiveRecord::Migration
    def self.up
        create_table :account_roles, :force => true do |t|
            t.string    :title
            t.datetime  :deleted_at
            t.timestamps
        end

        ActiveRecord::Base.connection.execute("INSERT INTO `account_roles` (`title`, `created_at`, `updated_at`) VALUES( 'active', '#{Time.now.to_s(:db)}', '#{Time.now.to_s(:db)}')")
    end

    def self.down
        drop_table :account_roles
    end
end

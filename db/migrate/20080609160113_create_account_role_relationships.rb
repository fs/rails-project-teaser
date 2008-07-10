class CreateAccountRoleRelationships < ActiveRecord::Migration
    def self.up
        create_table :account_role_relationships, :force => true do |t|
            t.integer :account_id, :account_role_id
            t.datetime  :deleted_at
            t.timestamps
        end

        AccountRoleRelationship.create(
            :account_role_id => AccountRole.find_by_title('admin'),
            :account_id      => Account.find_by_login('admin')
        )
    end

    def self.down
        drop_table :account_role_relationships
    end
end

class CreateTwitterAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :twitter_accounts do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :name, null: false
      t.string :username, null: false
      t.string :image, null: false
      t.string :token, null: false
      t.string :secret, null: false

      t.timestamps
    end
  end
end

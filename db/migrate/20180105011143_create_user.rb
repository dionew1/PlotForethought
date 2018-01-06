class CreateUser < ActiveRecord::Migration[5.1]
  def change
    enable_extension("citext")

    create_table :users do |t|
      t.text     :google_id
      t.citext   :first_name
      t.citext   :last_name
      t.citext   :email
      t.text     :token
      t.datetime :oauth_expires_at
    end
  end
end

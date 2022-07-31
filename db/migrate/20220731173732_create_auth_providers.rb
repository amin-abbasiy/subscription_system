class CreateAuthProviders < ActiveRecord::Migration[7.0]
  def change
    create_table :auth_providers do |t|
      t.integer :type
      t.references :user, null: false, foreign_key: true
      t.string :access_token
      t.string :refresh_token
      t.string :id_token
      t.datetime :access_token_exp

      t.timestamps
    end
  end
end

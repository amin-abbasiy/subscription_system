class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.bigint :on_behalf_id
      t.references :user, null: false, foreign_key: true
      t.references :invoice, null: false, foreign_key: true
      t.string :amount
      t.integer :amount_decimal
      t.string :payment_method
      t.string :payment_date
      t.string :currency

      t.timestamps
    end

    add_index :payments, :on_behalf_id
  end
end

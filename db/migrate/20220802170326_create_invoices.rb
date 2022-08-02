class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.string :title
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.bigint :on_behalf_id
      t.string :currency
      t.string :pdf_url
      t.string :status
      t.datetime :start_subscription
      t.datetime :end_subscription
      t.string :subscription_id, null: false
      t.string :total_amount, null: false
      t.integer :total_amount_decimal
      t.string :discount
      t.string :tax_amount
      t.string :coupon

      t.timestamps
    end

    add_index :invoices, :on_behalf_id
    add_index :invoices, :subscription_id
  end
end

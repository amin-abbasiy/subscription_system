class CreateSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions do |t|
      t.references :plan, null: false, foreign_key: true
      t.bigint :subscriber_id, null: false
      t.bigint :on_behalf_id
      t.string :currency
      t.datetime :current_period_start
      t.datetime :current_period_end
      t.string :default_payment_method
      t.text :description
      t.string :last_invoice_id
      t.string :status
      t.string :canceled_at
      t.text :cancelation_reason
      t.string :discount
      t.datetime :trial_start
      t.datetime :trial_end
      t.string :interval
      t.string :interval_count
      t.datetime :start_at
      t.datetime :end_at

      t.timestamps
    end


    add_index :subscriptions, :subscriber_id
    add_index :subscriptions, :on_behalf_id
  end
end

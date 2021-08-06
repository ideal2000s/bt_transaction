class CreateLargestUnconfirmedTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :largest_unconfirmed_transactions do |t|
      t.string :hash_value, null: false, index: { unique: true } # Set this field name as 'hash_value' since 'hash' is a special character
      t.bigint :total, default: 0
      t.bigint :fees, default: 0
      t.jsonb :inputs, array: true, default: []
      t.jsonb :outputs, array: true, default: []

      t.timestamps
    end
  end
end

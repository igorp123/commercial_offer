class CreateOffers < ActiveRecord::Migration[7.1]
  def change
    create_table :offers do |t|
      t.string :client
      t.float :amount
      t.text :comment
      t.text :body

      t.timestamps
    end
  end
end

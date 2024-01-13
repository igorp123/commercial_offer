class AddMissingNullCheck < ActiveRecord::Migration[7.1]
  def change
    change_column_null :offers, :client, false
  end
end

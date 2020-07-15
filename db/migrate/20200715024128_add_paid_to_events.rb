class AddPaidToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :paid, :boolean, default: false
  end
end

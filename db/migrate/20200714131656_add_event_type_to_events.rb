class AddEventTypeToEvents < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      CREATE TYPE types AS ENUM ('physical', 'online');
      ALTER TABLE events ADD event_type types DEFAULT 'physical';
    SQL
  end

  def down
    execute <<-SQL
      DROP TYPE types CASCADE;
    SQL
    if ActiveRecord::Base.connection.column_exists?(:events, :event_type)
      remove_column :events, :event_type
    end
  end
end

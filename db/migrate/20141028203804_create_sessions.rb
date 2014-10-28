class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :session_id, index: true
      t.integer :viewed, array: true, default: []

      t.timestamps
    end
  end
end

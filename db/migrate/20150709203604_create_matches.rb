class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.datetime :scheduled_start_at

      t.timestamps null: false
    end
  end
end

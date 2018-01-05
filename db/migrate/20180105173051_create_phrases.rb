class CreatePhrases < ActiveRecord::Migration
  def change
   create_table :phrases do |t|
      t.boolean :visible, :default => false
      t.timestamps null: false
    end
  end
end

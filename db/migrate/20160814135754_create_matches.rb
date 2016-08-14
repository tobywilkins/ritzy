class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.timestamps
      t.references :user_one
      t.references :user_two
    end
  end
end

class CreateSwipes < ActiveRecord::Migration[5.0]
  def change
    create_table :swipes do |t|
      t.timestamps
      t.references :user
      t.references :swiped_user
      t.boolean :yes_swipe
    end
  end
end

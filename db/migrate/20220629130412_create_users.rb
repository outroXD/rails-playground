class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :tweets do |t|
      t.string      :name
      t.text        :text
      t.text        :image
      t.timestamps null: true
    end
  end
end
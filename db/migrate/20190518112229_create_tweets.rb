class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string      :country
      t.text        :city
      t.text        :image
      t.text        :text
      t.timestamps null: true
    end
  end
end

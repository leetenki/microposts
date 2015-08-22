class CreateRetweetRelationships < ActiveRecord::Migration
  def change
    create_table :retweet_relationships do |t|
      t.references :origin, index: true
      t.references :retweet, index: true

      t.timestamps null: false
      t.index [:origin_id, :retweet_id], :unique => true
    end
  end
end

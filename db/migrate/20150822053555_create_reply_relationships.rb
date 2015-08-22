class CreateReplyRelationships < ActiveRecord::Migration
  def change
    create_table :reply_relationships do |t|
      t.references :origin, index: true
      t.references :reply, index: true

      t.timestamps null: false
      t.index [:origin_id, :reply_id], :unique => true
    end
  end
end

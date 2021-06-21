class CreateMemos < ActiveRecord::Migration[6.0]
  def change
    create_table :memos do |t|
      t.string :memo_title   
      t.string :memo,         null: false
      t.integer :frame_type_id,   null: false
      t.references :user,     null: false, foreign_key: true


      t.timestamps
    end
  end
end

class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.date :from
      t.date :to
      t.string :location

      t.timestamps
    end
  end
end

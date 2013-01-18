class CreateFrases < ActiveRecord::Migration
  def self.up
    create_table :frases do |t|
      t.string :autor
      t.text :frase
      t.string :created_by
      t.timestamps
    end
  end

  def self.down
    drop_table :frases
  end
end

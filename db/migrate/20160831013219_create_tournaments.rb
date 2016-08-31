class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.string :name
      t.string :weapon
      t.string :sex
      t.string :age
      t.boolean :team
      t.date :date

      t.timestamps null: false
    end
  end
end

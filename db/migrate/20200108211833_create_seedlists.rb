class CreateSeedlists < ActiveRecord::Migration[5.2]
  def change
    create_table :seedlists do |t|
      t.string :name
      t.string :year

      t.timestamps
    end
  end
end

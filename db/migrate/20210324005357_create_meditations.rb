class CreateMeditations < ActiveRecord::Migration[6.1]
  def change
    create_table :meditations do |t|
      t.string :title
      t.text :summary
      t.string :narrator
      t.timestamps
    end
  end
end

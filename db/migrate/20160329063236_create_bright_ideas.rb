class CreateBrightIdeas < ActiveRecord::Migration
  def change
    create_table :bright_ideas do |t|
      t.text :idea

      t.timestamps null: false
    end
  end
end

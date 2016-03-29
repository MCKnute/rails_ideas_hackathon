class AddUserRefToBrightIdeas < ActiveRecord::Migration
  def change
    add_reference :bright_ideas, :user, index: true, foreign_key: true
  end
end

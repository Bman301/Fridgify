class AddColumnStepsToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :steps, :text
  end
end

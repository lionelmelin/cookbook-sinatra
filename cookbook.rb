require_relative 'recipe.rb'
require 'csv'

class Cookbook
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @recipes = []
    # csv_options
    CSV.foreach(csv_file_path) do |row|
      @recipes << Recipe.new(row[0], row[1], row[2], row[3] == 'true', row[4])
    end
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
    write_csv
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    write_csv
  end

  def mark_recipe(index)
    @recipes[index].mark_as_read!
    write_csv
  end

  private

  def write_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      @recipes.each do |rec|
        csv << [rec.name, rec.description, rec.prep_time, rec.read?.to_s, rec.difficulty]
      end
    end
  end
end


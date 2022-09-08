require_relative 'lib/database_connection'
require_relative 'lib/recipe_repository'

DatabaseConnection.connect('recipes_directory')
recipe_repository = RecipeRepository.new

query = 'select * from recipes;'
result = DatabaseConnection.exec_params(query, [])

result.each do |record|
    puts record
end
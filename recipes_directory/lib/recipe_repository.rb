require_relative 'recipe'

class RecipeRepository

    # Selecting all records
    # No arguments
    def all
      # Executes the SQL query:
       query = 'SELECT * FROM recipes;'
       result_set = DatabaseConnection.exec_params(query, [])
  
      # Returns an array of Recipe objects.

        recipes = []

        result_set.each do |record|
            recipe = Recipe.new

            recipe.id = record['id']
            recipe.name = record['name']
            recipe.cooking_time = record['cooking_time']
            recipe.rating = record['rating']

            recipes << recipe
        end
        return recipes
    end
  
    # Gets a single record by its ID
    # One argument: the id (number)
    def find(id)
      # Executes the SQL query:
        query = 'SELECT * FROM recipes WHERE id = $1;'
        params = [id]
        result_set = DatabaseConnection.exec_params(query, params)

        record = result_set[0]

        recipe = Recipe.new

        recipe.id = record['id']
        recipe.name = record['name']
        recipe.cooking_time = record['cooking_time']
        recipe.rating = record['rating']        

        return recipe
    end
  end
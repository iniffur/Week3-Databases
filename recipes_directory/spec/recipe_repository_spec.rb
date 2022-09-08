require 'recipe_repository'

RSpec.describe RecipeRepository do
    def reset_recipe_table
        user = 'iniffur'
        password = ENV['PGPASSWORD']
        seed_sql = File.read('spec/seeds_recipes.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test', user: user, password: password })
        connection.exec(seed_sql)
    end

    before(:each) do
        reset_recipe_table
    end

    it 'Returns all recipes' do
        repo = RecipeRepository.new

        recipes = repo.all

        expect(recipes.length).to eq(2)

        expect(recipes[0].id).to eq '1'
        expect(recipes[0].name).to eq 'Lasagne'
        expect(recipes[0].cooking_time).to eq '60'
        expect(recipes[0].rating).to eq '5'
    end

    it "Returns the second recipe: Pad thai using find method" do
        repo = RecipeRepository.new

        recipe = repo.find(2)

        expect(recipe.id).to eq '2'
        expect(recipe.name).to eq 'Pad Thai'
        expect(recipe.cooking_time).to eq '20'
        expect(recipe.rating).to eq '4'
    end
end
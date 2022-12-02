class RecipesController < ApplicationController
    def index 
        if session[:user_id]
            user = User.find(session[:user_id])
            recipes = user.recipes
            render json: recipes, status: :created
        else
            render json: {errors: ["not found"]}, status: :unauthorized
        end
    end

    def create
        if session[:user_id]
            recipe = User.find(session[:user_id]).recipes.create(recipe_params)
            if recipe.valid? 
                render json: recipe, status: :created
            else
                render json: {errors: ["invalid recipe"]}, status: :unprocessable_entity
            end
        else
            render json: {errors: ["unauthorized"]}, status: :unauthorized
        end
    end

    private
    
    def recipe_params
        params.permit(:title,:instructions, :minutes_to_complete, :user_id)
    end


end

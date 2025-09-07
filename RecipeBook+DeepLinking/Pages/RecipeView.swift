//
//  RecipeView.swift
//  RecipeBook+DeepLinking
//
//  Created by Elliott Harris on 8/16/25.
//

import SwiftUI

struct RecipeView: View {
	let recipe: Recipe
	
    var body: some View {
		NavigationStack {
			List(recipe.ingredients) { ingredient in
				Text("\(ingredient.amount) \(ingredient.unit) \(ingredient.name)")
			}
			.navigationTitle(recipe.name)
		}
    }
}

#Preview {
	RecipeView(recipe: Recipe(
		name: "Spaghetti Carbonara",
		instructions: [],
		ingredients: [
			Ingredient(name: "Spaghetti", amount: 1, unit: "lb"),
			Ingredient(name: "Parmesan Cheese", amount: 0.5, unit: "cups"),
			Ingredient(name: "Black Pepper", amount: 1, unit: "to taste"),
		]
	))
}

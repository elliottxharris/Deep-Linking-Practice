//
//  AppViewModel.swift
//  RecipeBook+DeepLinking
//
//  Created by Elliott Harris on 8/16/25.
//

import SwiftUI

@Observable
final class AppViewModel {
	var recipes = [
		Recipe(
			name: "Spaghetti Carbonara",
			instructions: [],
			ingredients: [
				Ingredient(name: "Spaghetti", amount: 1, unit: "lb"),
				Ingredient(name: "Parmesan Cheese", amount: 0.5, unit: "cups"),
				Ingredient(name: "Black Pepper", amount: 1, unit: "to taste"),
			]
		),
		Recipe(
			name: "Chicken Curry",
			instructions: [],
			ingredients: [
				Ingredient(name: "Chicken Breast", amount: 1, unit: "lb"),
				Ingredient(name: "Coconut Milk", amount: 1, unit: "cup"),
				Ingredient(name: "Onion", amount: 1, unit: ""),
				Ingredient(name: "Garlic", amount: 1, unit: "clove"),
				Ingredient(name: "Curry Powder", amount: 1, unit: "tbsp"),
		   ]
		)
	]
	
	var shoppingList = [
		Ingredient(name: "Chicken Breast", amount: 1, unit: "lb"),
		Ingredient(name: "Coconut Milk", amount: 1, unit: "cup"),
		Ingredient(name: "Onion", amount: 1, unit: ""),
		Ingredient(name: "Garlic", amount: 1, unit: "clove"),
		Ingredient(name: "Curry Powder", amount: 1, unit: "tbsp"),
	]
	
	var searchText = ""
	var tabIndex = 0
	var selectedRecipe: Recipe? = nil
}



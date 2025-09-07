//
//  Recipe.swift
//  RecipeBook+DeepLinking
//
//  Created by Elliott Harris on 8/16/25.
//

import Foundation

struct Recipe: Identifiable, Hashable {
	let id = UUID()
	let name: String
	let instructions: [String]
	let ingredients: [Ingredient]
}

//
//  Ingredient.swift
//  RecipeBook+DeepLinking
//
//  Created by Elliott Harris on 8/16/25.
//

import Foundation

struct Ingredient: Identifiable, Hashable {
	let id: UUID = UUID()
	let name: String
	let amount: Double
	let unit: String
}

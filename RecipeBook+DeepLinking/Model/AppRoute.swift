//
//  AppRoute.swift
//  RecipeBook+DeepLinking
//
//  Created by Elliott Harris on 8/17/25.
//

import Foundation

enum AppRoute: Hashable {
	case shoppingList
	case settings
	case recipe(String)
	case search(String)
}

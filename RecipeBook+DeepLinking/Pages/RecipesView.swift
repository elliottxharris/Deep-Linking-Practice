//
//  RecipesView.swift
//  RecipeBook+DeepLinking
//
//  Created by Elliott Harris on 8/17/25.
//

import SwiftUI

struct RecipesView: View {
	@Environment(AppViewModel.self) private var appViewModel
	
	var fileredRecipes: [Recipe] {
		if appViewModel.searchText.isEmpty {
			return appViewModel.recipes
		}
		
		return appViewModel.recipes.filter({ $0.name.contains(appViewModel.searchText) })
	}
	
    var body: some View {
		@Bindable var appViewModel = appViewModel
		
		NavigationStack {
			List(fileredRecipes) { recipe in
				Text(recipe.name)
					.onTapGesture {
						appViewModel.selectedRecipe = recipe
					}
			}
			.navigationTitle(Text("Recipes"))
			.navigationDestination(item: $appViewModel.selectedRecipe) { recipe in
				RecipeView(recipe: recipe)
			}
			.searchable(
				text: $appViewModel.searchText
			)
		}
    }
}

#Preview {
    RecipesView()
		.environment(AppViewModel())
}

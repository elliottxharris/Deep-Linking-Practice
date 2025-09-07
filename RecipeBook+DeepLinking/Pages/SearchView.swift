//
//  SearchView.swift
//  RecipeBook+DeepLinking
//
//  Created by Elliott Harris on 9/6/25.
//

import SwiftUI

struct SearchView: View {
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
						appViewModel.tabIndex = 0
						appViewModel.selectedRecipe = recipe
						appViewModel.searchText = ""
					}
			}
			.navigationTitle(Text("Search"))
			.searchable(
				text: $appViewModel.searchText
			)
		}
	}
}

#Preview {
    SearchView()
		.environment(AppViewModel())
}

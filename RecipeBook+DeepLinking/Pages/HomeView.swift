//
//  HomeView.swift
//  RecipeBook+DeepLinking
//
//  Created by Elliott Harris on 8/16/25.
//

import SwiftUI

struct HomeView: View {
	@Environment(AppViewModel.self) private var appViewModel
    var body: some View {
		@Bindable var appViewModel = appViewModel
		
		TabView(selection: $appViewModel.tabIndex) {
			Tab("Recipes", systemImage: "carrot", value: 0) {
				RecipesView()
			}
			
			Tab("List", systemImage: "list.bullet", value: 1) {
				ShoppingListView()
			}
			
			Tab("Settings", systemImage: "gear", value: 2) {
				SettingsView()
			}
			
			Tab("Search", systemImage: "magnifyingglass", value: 3, role: .search) {
				NavigationStack {
					SearchView()
				}
			}
		}
		.tabViewSearchActivation(.searchTabSelection)
		.onOpenURL { url in
			handleUrl(url)
		}
    }
	
	private func handleUrl(_ url: URL) {
		switch url.host() {
			case "shoppingList":
				appViewModel.tabIndex = 1
			case "settings":
				appViewModel.tabIndex = 2
			case "recipe":
				appViewModel.tabIndex = 0
				if let id = url.pathComponents.last, let recipe = appViewModel.recipes.first(
					where: { $0.id == UUID(uuidString: id) }
				) {
					appViewModel.selectedRecipe = recipe
				}
			case "search":
				appViewModel.tabIndex = 0
				if let components = URLComponents(string: url.absoluteString), let query = components.queryItems, let queryValue = query.first?.value {
					appViewModel.searchText = queryValue
				}
			default:
				break
		}
	}
}

#Preview {
    HomeView()
		.environment(AppViewModel())
}

//
//  HomeView.swift
//  RecipeBook+DeepLinking
//
//  Created by Elliott Harris on 8/16/25.
//

import SwiftUI

struct HomeView: View {
	@Environment(AppViewModel.self) private var appViewModel
	
	@State private var tabIndex = 0
	
    var body: some View {
		@Bindable var appViewModel = appViewModel
		
		TabView(selection: $tabIndex) {
			Tab(value: 0) {
				RecipesView()
			} label: {
				Label("Recipes", systemImage: "carrot")
			}
			
			Tab(value: 1) {
				ShoppingListView()
			} label: {
				Label("List", systemImage: "list.bullet")
			}
			
			Tab(value: 2) {
				SettingsView()
			} label: {
				Label("Settings", systemImage: "gear")
			}
		}
		.onOpenURL { url in
			handleUrl(url)
		}
    }
	
	private func handleUrl(_ url: URL) {
		switch url.host() {
			case "shoppingList":
				tabIndex = 1
			case "settings":
				tabIndex = 2
			case "recipe":
				tabIndex = 0
				if let id = url.pathComponents.last, let recipe = appViewModel.recipes.first(
					where: { $0.id == UUID(uuidString: id) }
				) {
					appViewModel.selectedRecipe = recipe
				}
			case "search":
				tabIndex = 0
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

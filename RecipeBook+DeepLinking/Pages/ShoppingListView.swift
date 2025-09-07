//
//  ShoppingListView.swift
//  RecipeBook+DeepLinking
//
//  Created by Elliott Harris on 8/16/25.
//

import SwiftUI

struct ShoppingListView: View {
	@Environment(AppViewModel.self) private var appViewModel
	
    var body: some View {
		NavigationStack {
			List(appViewModel.shoppingList) { item in
				Text(item.name)
			}
			.navigationTitle(Text("Shopping List"))
		}
    }
}

#Preview {
    ShoppingListView()
		.environment(AppViewModel())
}

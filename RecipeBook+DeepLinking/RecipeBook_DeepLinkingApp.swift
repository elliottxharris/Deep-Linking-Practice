//
//  RecipeBook_DeepLinkingApp.swift
//  RecipeBook+DeepLinking
//
//  Created by Elliott Harris on 8/16/25.
//

import SwiftUI

@main
struct RecipeBook_DeepLinkingApp: App {
    var body: some Scene {
        WindowGroup {
			HomeView()
				.environment(AppViewModel())
        }
    }
}

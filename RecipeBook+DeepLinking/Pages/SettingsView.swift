//
//  SettingsView.swift
//  RecipeBook+DeepLinking
//
//  Created by Elliott Harris on 8/16/25.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
		NavigationStack {
			List {
				NavigationLink(destination: Text("Settings")) {
					Text("Accent Color")
				}
			}
			.navigationTitle(Text("Settings"))
		}
    }
}

#Preview {
    SettingsView()
}

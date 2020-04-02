//
//  SearchView.swift
//  Neu Music Player
//
//  Created by Spencer Curtis on 4/2/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import SwiftUI

protocol SearchResult {
	var mainText: String { get }
	var subText: String? { get }
	var id: UUID { get }
}

struct Artist: SearchResult {
	var name: String
	var id = UUID()

	var mainText: String {
		return name
	}

	var subText: String? {
		return name
	}
}

struct SearchView: View {
	var searchResults: [SearchResult] = [
		Artist(name: "Weezer"),
		Artist(name: "The Beatles"),
		Artist(name: "Weezer"),
		Artist(name: "The Beatles"),
		Artist(name: "Weezer"),
		Artist(name: "The Beatles"),
		Artist(name: "Weezer"),
		Artist(name: "The Beatles"),
		Artist(name: "Weezer"),
		Artist(name: "The Beatles"),
		Artist(name: "Weezer"),
		Artist(name: "The Beatles")
	]

	init() {
		UITableView.appearance().backgroundColor = .clear
		UITableViewCell.appearance().backgroundColor = .clear
	}

	var body: some View {
		ZStack {
			LinearGradient(gradient:
				Gradient(colors: [.bgGradientTop, .bgGradientBottom]), startPoint: .top, endPoint: .bottom)
				.edgesIgnoringSafeArea(.all)

			List(searchResults, id: \.id) { (searchResult) in
				Button(action: {}) {
					HStack {
						VStack(alignment: .leading) {
							Text(searchResult.mainText)
								.foregroundColor(.buttonColor)
								.font(Font.system(.headline).weight(.medium))

							if (searchResult.subText != nil) {
								Text(searchResult.subText!)
									.foregroundColor(.buttonColor)
									.font(Font.system(.caption))
							}
						}
						.padding(.leading, 18)

						Spacer()

						BasicButton(imageName: "play.fill", size: 40, symbolConfig: .searchButtonConfig)
							.padding(.trailing, 12)
					}
				}
				.buttonStyle(SearchRowStyle())
				.frame(height: 60)
			}
		}
	}
}

struct SearchView_Previews: PreviewProvider {
	static var previews: some View {
		SearchView()
	}
}


struct SearchRowStyle: ButtonStyle {
	func makeBody(configuration: Configuration) -> some View {
		ZStack {
			RoundedRectangle(cornerRadius: 20, style: .continuous)
				.fill(fillForBackground(for: configuration.isPressed))
				.shadow(color: Color.white.opacity(0.1), radius: 1, x: 0, y: -1)
				.shadow(color: Color.black.opacity(0.35), radius: 1, x: 0, y: 1)
			configuration.label
		}
	}

	func fillForBackground(for isPressed: Bool) -> some ShapeStyle {
		if isPressed {
			return LinearGradient(gradient:
				Gradient(colors: [.bgGradientMedium, Color.bgGradientBottom]),
								  startPoint: .bottom,
								  endPoint: .top)
		} else {
			return LinearGradient(gradient: Gradient(colors: [.clear]),
								  startPoint: .bottom,
								  endPoint: .top)
		}
	}
}

//
//  SearchResultRow.swift
//  Neu Music Player
//
//  Created by Michael Redig on 4/2/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import SwiftUI

struct SearchResultRow: View {
	var searchResult: SearchResult

	@Binding var selectedResult: SearchResult?

	var body: some View {
		Button(action: {
			self.selectedResult = self.searchResult
		}) {
			ZStack {
				if searchResult.id == selectedResult?.id {
					RoundedRectangle(cornerRadius: 14)
						.fill(LinearGradient(gradient: Gradient(colors: [Color.bgGradientMedium, .bgGradientBottom]), startPoint: .bottom, endPoint: .top))
				}
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
						.padding(.trailing, 16)
				}
			}
		}
		.buttonStyle(SearchRowStyle())
		.frame(height: 80)
	}
}

//struct SearchResultRow_Previews: PreviewProvider {
//	static var previews: some View {
//		let artist = Artist(name: "Fart")
//		return SearchResultRow(searchResult: artist, selectedResult: Binding<SearchResult>(nil))
//	}
//}

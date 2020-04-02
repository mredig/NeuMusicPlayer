//
//  ContentView.swift
//  Neu Music Player
//
//  Created by Spencer Curtis on 3/30/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import SwiftUI

class Song: ObservableObject {
	let title: String = "Low Life"
	let artist: String = "Future ft. The Weeknd"
	let duration: TimeInterval = 120
	@Published var currentTime: TimeInterval = 50
	let coverArt: UIImage = UIImage(named: "BurningFlower")!
}

struct ContentView: View {
	@ObservedObject var song = Song()

	var body: some View {
		GeometryReader { geometry in
			ZStack {
				LinearGradient(gradient:
					Gradient(colors: [.bgGradientTop, .bgGradientBottom]), startPoint: .top, endPoint: .bottom)
					.edgesIgnoringSafeArea(.all)

				// This will hold every view on top of the background gradient
				VStack {
					HStack {
						BasicButton(imageName: "arrow.left", size: 50, symbolConfig: .navButtonConfig)
							.padding(.leading, 30)
						Spacer()
						Text("PLAYING NOW")
							.foregroundColor(.buttonColor)
							.font(Font.system(.headline).smallCaps())


						Spacer()
						BasicButton(imageName: "line.horizontal.3", size: 50, symbolConfig: .navButtonConfig)
							.padding(.trailing, 40)
					}

					CoverArtView(size: geometry.size.width * 0.85)
						.padding(.top, 16)
						.padding(.bottom, 30)

					Text(self.song.title)
						.font(Font.system(.largeTitle).weight(.medium))
						.foregroundColor(.buttonColor)

					Text(self.song.artist)
						.font(Font.system(.callout))
						.foregroundColor(.buttonColor)


					PlayerProgressView(song: self.song)
						.padding(.top, 40)

					Spacer()

					HStack {
						Spacer()
						BasicButton(imageName: "backward.fill", size: 70, symbolConfig: .playbackButtonConfig)
						PlayPauseButton()
							.frame(width: 75, height: 75)
							.padding(.horizontal, 14)
						BasicButton(imageName: "forward.fill", size: 70, symbolConfig: .playbackButtonConfig)
						Spacer()
					}
				}
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}

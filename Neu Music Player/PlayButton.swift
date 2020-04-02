//
//  PlayButtonView.swift
//  Neu Music Player
//
//  Created by Michael Redig on 4/2/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import SwiftUI

struct PlayPauseButton: View {
	@State var isPlaying = false

	var body: some View {
		Button(action: {
			self.isPlaying.toggle()
		}) {

			ZStack {
				Circle()
					.fill(
						LinearGradient(gradient: Gradient(colors: colorsForIsPlaying()), startPoint: .topLeading, endPoint: .bottomTrailing)
				)
				Circle()
					.fill(
						LinearGradient(gradient: Gradient(colors: colorsForIsPlaying()), startPoint: .bottomTrailing, endPoint: .topLeading)
				)
					.padding(2)

				Image(systemName: isPlaying ? "pause" : "play.fill")
					.foregroundColor(.white)
					.font(Font.system(.callout).weight(.black))
			}
		}
		.shadow(color: Color.black.opacity(0.3), radius: 10, x: 5, y: 5)
		.shadow(color: Color.white.opacity(0.1), radius: 10, x: -5, y: -5)


	}

	func colorsForIsPlaying() -> [Color] {
		if isPlaying {
			return [.pauseLightOrange, .pauseDarkOrange]
		} else {
			return [.playLightGreen, .playDarkGreen]
		}
	}
}

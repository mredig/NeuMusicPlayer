//
//  CoverArt.swift
//  Neu Music Player
//
//  Created by Michael Redig on 4/2/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import SwiftUI

struct CoverArtView: View {
	var size: CGFloat = 360
	var body: some View {
		ZStack {
			Circle()
				.fill(Color.bgGradientBottom.opacity(0.7))
				.frame(width: size, height: size)

			Image("BurningFlower")
				.resizable()
				.font(Font.system(.headline).weight(.bold))
				.aspectRatio(contentMode: .fill)
				.foregroundColor(.buttonColor)
				.frame(width: size * 0.94, height: size * 0.94)
				.background(
					LinearGradient(gradient: Gradient(colors: [.bgGradientTop, .bgGradientBottom]),
								   startPoint: .topLeading,
								   endPoint: .bottomTrailing))
				.clipShape(Circle())
		}
		.shadow(color: Color.black.opacity(0.4), radius: 20, x: 25, y: 25)
		.shadow(color: Color.white.opacity(0.1), radius: 15, x: -15, y: -15)
	}
}


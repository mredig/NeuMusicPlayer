//
//  BasicButtonView.swift
//  Neu Music Player
//
//  Created by Michael Redig on 4/2/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import SwiftUI

struct BasicButton: View {
	var imageName: String
	var size: CGFloat
	var symbolConfig: UIImage.SymbolConfiguration

	var body: some View {
		Button(action: {
			// TODO: - Add the back navigation later
		}) {
			ZStack {
				Circle()
					.fill(LinearGradient(gradient: Gradient(colors: [.bgGradientTop, .bgGradientBottom]),
										 startPoint: .bottomTrailing,
										 endPoint: .topLeading))
					.frame(width: size, height: size)

				Image(uiImage: UIImage(systemName: imageName, withConfiguration: symbolConfig)!)
					//                    .resizable()
					.font(Font.system(.headline).weight(.bold))
					.aspectRatio(contentMode: .fit)
					.foregroundColor(.buttonColor)
					.frame(width: size * 0.95, height: size * 0.95)
					//                    .padding(12)
					.background(
						LinearGradient(gradient: Gradient(colors: [.bgGradientTop, .bgGradientBottom]),
									   startPoint: .topLeading,
									   endPoint: .bottomTrailing))
					.clipShape(Circle())
			}
			.shadow(color: Color.black.opacity(0.3), radius: 7.5, x: 5, y: 5)
			.shadow(color: Color.white.opacity(0.1), radius: 7.5, x: -5, y: -5)

		}
	}
}



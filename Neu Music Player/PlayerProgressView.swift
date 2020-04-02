//
//  PlayerProgress.swift
//  Neu Music Player
//
//  Created by Michael Redig on 4/2/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import SwiftUI

struct PlayerProgressView: View {
	@ObservedObject var song: Song
	var dateFormatter: DateFormatter = {
		let formatter = DateFormatter()
		formatter.dateFormat = "m:ss"
		formatter.timeZone = TimeZone(secondsFromGMT: 0)

		return formatter
	}()
	var trackRadius: CGFloat = 4

	var body: some View {
		VStack(spacing: 0) {
			HStack {
				Text(formattedTimeFor(timeInterval: song.currentTime))
				Spacer()
				Text(formattedTimeFor(timeInterval: song.duration))
			}
			.foregroundColor(.buttonColor)
			.font(Font.system(.caption))

			ZStack {
				RoundedRectangle(cornerRadius: trackRadius)
					.fill(LinearGradient(gradient:
						Gradient(stops: [Gradient.Stop(color: .bgGradientTop, location: 0.1),
										 Gradient.Stop(color: Color.black.opacity(0.8), location: 0.5)]),
										 startPoint: .bottom,
										 endPoint: .top))
					.frame(height: trackRadius * 2)

				GeometryReader { geometry in
					HStack {
						RoundedRectangle(cornerRadius: self.trackRadius)
							.fill(
								LinearGradient(gradient: Gradient(colors: [.trackOrange, .trackYellow]),
											   startPoint: .leading,
											   endPoint: .trailing)
						)
							.frame(width: geometry.size.width * self.percentageCompleteForSong(), height: self.trackRadius * 2)
						Spacer(minLength: 0)

					}
				}

				GeometryReader { geometry in

					HStack {
						Circle()
							.fill(
								RadialGradient(gradient: Gradient(stops: [
									Gradient.Stop(color: .trackYellow, location: 0.0),
									Gradient.Stop(color: .bgGradientBottom, location: 0.00001),
									Gradient.Stop(color: .bgGradientTop, location: 1),
								]), center: .center, startRadius: 6, endRadius: 40)
						)
							.frame(width: 40, height: 40)
							.padding(.leading, geometry.size.width * self.percentageCompleteForSong() - 20)
							.gesture(
								DragGesture()
									.onChanged({ (value) in
										self.song.currentTime = self.time(for: value.location.x, in: geometry.size.width)
									})
						)
						Spacer(minLength: 0)
					}
				}
			}
			.frame(height: 40)
		}
		.padding(.horizontal, 30)
	}

	func formattedTimeFor(timeInterval: TimeInterval) -> String {
		let date = Date(timeIntervalSinceReferenceDate: timeInterval)
		return dateFormatter.string(from: date)
	}

	func time(for location: CGFloat, in width: CGFloat) -> TimeInterval {

		let percentage = location / width

		let time = song.duration * TimeInterval(percentage)

		if time < 0 {
			return 0
		} else if time > song.duration {
			return song.duration
		}

		return time


	}

	func percentageCompleteForSong() -> CGFloat {
		return CGFloat(song.currentTime / song.duration)
	}
}

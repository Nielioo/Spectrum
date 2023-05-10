//
//  StartView.swift
//  Spectrum
//
//  Created by Daniel Aprillio on 18/04/23.
//

import SwiftUI
import AVKit

struct StartView: View {
    // source: https://lottiefiles.com/90366-the-player
    var player = AVPlayer(url: Bundle.main.url(forResource: "thePlayer", withExtension: "mp4")!)
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Spectrum")
                    .font(.system(size: 96))
                    .foregroundColor(Color.black)
                    .bold()
                Spacer().frame(height: 48)
                NavigationLink(destination: QuizView()){
                    VideoPlayer(player: player)
                        .frame(width: 400, height: 400)
                        .onAppear{
                            player.play()
                            NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: nil, queue: .main) { _ in
                                player.seek(to: .zero)
                                player.play()
                            }
                        }
                        .disabled(true)
                }
                Text("-- Tap to Play --")
                    .font(.system(size: 24))
                    .foregroundColor(Color.gray)
            }
        }.navigationViewStyle(.stack)
        
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}

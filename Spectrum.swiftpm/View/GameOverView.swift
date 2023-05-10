//
//  GameOverView.swift
//  Spectrum
//
//  Created by Daniel Aprillio on 18/04/23.
//

import SwiftUI
import AVKit

struct GameOverView: View {
    
    @Binding var isWin: Bool
    
    @State private var resultStr = "Game Over"
    
    // source: https://lottiefiles.com/116538-healthy-star
    var playerWin = AVPlayer(url: Bundle.main.url(forResource: "healthyStar", withExtension: "mp4")!)
    // source: https://lottiefiles.com/116537-puzzled-star
    var playerLose = AVPlayer(url: Bundle.main.url(forResource: "puzzledStar", withExtension: "mp4")!)
    
    var body: some View {
        NavigationView{
            VStack{
                
                Text(checkResult(condition: isWin))
                    .font(.system(size: 72))
                    .foregroundColor(Color.black)
                    .bold()
                
                if isWin{
                    VideoPlayer(player: playerWin)
                        .frame(width: 320, height: 320)
                        .onAppear{
                            playerWin.play()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: nil, queue: .main) { _ in
                                    playerWin.seek(to: .zero)
                                    playerWin.play()
                                }
                            }
                        }
                        .disabled(true)
                } else {
                    VideoPlayer(player: playerLose)
                        .frame(width: 320, height: 320)
                        .onAppear{
                            playerLose.play()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: nil, queue: .main) { _ in
                                    playerLose.seek(to: .zero)
                                    playerLose.play()
                                }
                            }
                            
                        }
                        .disabled(true)
                }
                
                
                NavigationLink(destination: QuizView()){
                    VStack{
                        Image(systemName: "arrow.counterclockwise")
                        Spacer().frame(height: 16)
                        Text("Play Again?")
                        
                    }
                    .frame(width: 260, height: 180)
                    .font(.system(size: 36, weight: .bold))
                    .foregroundColor(Color.white)
                    .background(Color.indigo)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .shadow(color: Color.gray, radius: 8, x: 2, y: 2)
                    .padding()
                    
                }
            }
        }.navigationViewStyle(.stack)
    }
    
    func checkResult(condition: Bool) -> String{
        if(isWin){
            return "Congratulations!"
        } else {
            return "Game Over"
        }
    }
}

struct GameOverView_Previews: PreviewProvider {
    static var previews: some View {
        GameOverView(isWin: .constant(true))
    }
}

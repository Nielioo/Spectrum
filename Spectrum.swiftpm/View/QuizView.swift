//
//  QuizView.swift
//  Spectrum
//
//  Created by Daniel Aprillio on 14/04/23.
//

import SwiftUI
//import AlertToast

struct QuizView: View {
    @State private var choiceArrayInt : [Int] = [0,1,2,3]
    @State private var choiceArrayString : [String] = ["a","b","c","d"]
    @State private var totalColors = 10
    
    @State private var firstColor = 0
    @State private var secondColor = 0
    @State private var correctAnswer = 0
    @State private var isCorrect = true
    @State private var showAlert = false
    
    @State private var score = 0
    @State private var health = 3
    
    @State private var isOver = false
    @State private var isWin = false
    
    var myColorCode:[Int:String] = [0:"Brown", 1:"Blue", 2:"Yellow", 3:"Red", 4:"White", 5:"Black", 6:"Green", 7:"Purple", 8:"Orange", 9:"Pink", 10:"Grey"]
    
    var body: some View {
        ZStack{
            VStack{
                
                HStack(alignment: .top){
                    HStack{
                        ForEach(0..<health, id: \.self){ i in
                            Image(systemName: "heart.fill")
                                .font(.title)
                                .foregroundColor(Color.red)
                        }
                        ForEach(health..<3, id: \.self){ i in
                            Image(systemName: "heart.fill")
                                .font(.title)
                                .foregroundColor(Color.gray)
                        }
                    }
//                    Text("Health: \(health)")
//                        .font(.title)
//                        .foregroundColor(Color.gray)
//                        .bold()
                    Spacer().frame(width: 420)
                    if(score == -1){
                        Text("Score: 0")
                            .font(.title)
                            .foregroundColor(Color.gray)
                            .bold()
                    } else {
                        Text("Score: \(score)")
                            .font(.title)
                            .foregroundColor(Color.gray)
                            .bold()
                    }
                    
                }.frame(minWidth: 0, maxWidth: .infinity)
                Spacer().frame(height: 48)
                
                Text("Guess the result of this color combo!")
                    .font(.largeTitle)
                    .bold()
                Spacer().frame(height: 24)
                Text("\(myColorCode[firstColor]!) + \(myColorCode[secondColor]!)")
                    .font(.largeTitle)
                    .bold()
                Spacer().frame(height: 48)
                ZStack{
                    VStack{
                        HStack {
                            ForEach(0..<2) {index in
                                Button {
                                    checkAnswer(answer: choiceArrayInt[index])
                                    addQuiz()
                                    showAlert.toggle()
                                    
                                    checkGameOver()
                                } label: {
                                    AnswerButton(colorStr: choiceArrayString[index])
                                }.shadow(color: Color.gray, radius: 8, x: 2, y: 2)
                            }
                        }
                        
                        HStack {
                            ForEach(2..<4) {index in
                                Button {
                                    checkAnswer(answer: choiceArrayInt[index])
                                    addQuiz()
                                    showAlert.toggle()
                                    
                                    checkGameOver()
                                } label: {
                                    AnswerButton(colorStr: choiceArrayString[index])
                                }.shadow(color: Color.gray, radius: 8, x: 2, y: 2)
                            }
                        }
                    }
                    if showAlert {
                        AlertToast(isCorrect: $isCorrect)
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                                    showAlert.toggle()
                                }
                            }
                    }
                    
                }
                
                
            }
            .onAppear(perform: addQuiz)
            .navigationBarHidden(true)
        }
    }
    
    func checkGameOver(){
        if (isOver || isWin){
            let newView = GameOverView(isWin: $isWin)
            UIApplication.shared.windows.first?.rootViewController = UIHostingController(rootView: newView)
        }
    }
    
    func checkAnswer(answer: Int){
        if answer == correctAnswer {
            self.score += 1
            self.isCorrect = true
        } else {
            self.health -= 1
            self.isCorrect = false
        }
        
        if score < 0 {
            self.score = 0
        }
        
        if health < 1 {
            isOver = true
            isWin = false
        } else if score == 10 {
            isOver = true
            isWin = true
        }
    }
    
    func addQuiz(){
        // add questions
        firstColor = Int.random(in: 0...totalColors)
        secondColor = Int.random(in: 0...totalColors)
        var isLoop: Bool = true
        
        while isLoop{
            if firstColor == secondColor {
                correctAnswer = firstColor
                isLoop = false
            } else if ((firstColor == 1 && secondColor == 2) || (firstColor == 2 && secondColor == 1)){
                correctAnswer = 6
                isLoop = false
            } else if ((firstColor == 1 && secondColor == 3) || (firstColor == 3 && secondColor == 1)){
                correctAnswer = 7
                isLoop = false
            } else if ((firstColor == 1 && secondColor == 8) || (firstColor == 8 && secondColor == 1)){
                correctAnswer = 0
                isLoop = false
            } else if ((firstColor == 2 && secondColor == 3) || (firstColor == 3 && secondColor == 2)){
                correctAnswer = 8
                isLoop = false
            } else if ((firstColor == 2 && secondColor == 7) || (firstColor == 7 && secondColor == 2)){
                correctAnswer = 0
                isLoop = false
            } else if ((firstColor == 3 && secondColor == 4) || (firstColor == 4 && secondColor == 3)){
                correctAnswer = 9
                isLoop = false
            } else if ((firstColor == 3 && secondColor == 6) || (firstColor == 6 && secondColor == 3)){
                correctAnswer = 0
                isLoop = false
            } else if ((firstColor == 4 && secondColor == 5) || (firstColor == 5 && secondColor == 4)){
                correctAnswer = 10
                isLoop = false
            } else {
                firstColor = Int.random(in: 0...totalColors)
                secondColor = Int.random(in: 0...totalColors)
                isLoop = true
            }
        }
        
        // add answers
        var answerList: [Int] = [0,1,2,3]
        var answerListString: [String] = ["a","b","c","d"]
        var isSame: Bool = true
        
        answerList[0] = correctAnswer
        answerList[1] = Int.random(in: 0...totalColors)
        answerList[2] = Int.random(in: 0...totalColors)
        answerList[3] = Int.random(in: 0...totalColors)
        
        // check duplicate answer
        while(isSame){
            if answerList[0] == answerList[1] {
                answerList[1] = Int.random(in: 0...totalColors)
            } else {
                isSame = false
            }
        }
        isSame = true
        while(isSame){
            if answerList[0] == answerList[2] || answerList[1] == answerList[2] {
                answerList[2] = Int.random(in: 0...totalColors)
            } else {
                isSame = false
            }
        }
        isSame = true
        while(isSame){
            if answerList[0] == answerList[3] || answerList[1] == answerList[3] || answerList[2] == answerList[3] {
                answerList[3] = Int.random(in: 0...totalColors)
            } else {
                isSame = false
            }
        }
        
        //convert answer to String
        answerList = answerList.shuffled()
        for i in 0...3{
            answerListString[i] = myColorCode[answerList[i]]!
        }
        
        choiceArrayInt = answerList
        choiceArrayString = answerListString
    }
}


struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
    }
}

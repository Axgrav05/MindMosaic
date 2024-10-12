import SwiftUI

struct AnagramView: View {
    @ObservedObject var game = AnagramGame() // Your AnagramGame class
    
    @State private var userGuess: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 183 / 255, green: 77 / 255, blue: 77 / 255)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    HStack {
                        NavigationLink(destination: Home().navigationBarBackButtonHidden(true)) {
                            ZStack {
                                Circle()
                                    .stroke(Color.white, lineWidth: 3)
                                    .frame(width: 50, height: 50)
                                    .contentShape(Circle())
                                
                                Image(systemName: "house.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.white)
                            }
                        }
                        Spacer()
                    }
                    .padding([.leading, .top], 20)
                    
                    Text("Anagrams")
                        .font(.custom("Avenir-Heavy", size: 50))
                        .foregroundColor(.white)
                        .padding(.top, -65)
                        .padding(.leading, 45)
                    
                    Spacer()
                    
                    Text("Scrambled Word: \(game.scrambledWord)")
                        .font(.custom("Avenir", size: 28))
                        .foregroundColor(.white)
                        .padding()
                    
                    TextField("Enter your guess", text: $userGuess)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .font(.custom("Avenir", size: 28))
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding()
                    
                    HStack{
                        Button(action: {
                            game.guess(word: userGuess) // Check the user's guess
                            // Note: Do not clear userGuess here so that the user can see their input
                        }) {
                            Text("Submit Guess")
                                .font(.custom("Avenir", size: 20))
                                .padding()
                                .background(Color.white)
                                .foregroundColor(.black)
                                .cornerRadius(10)
                        }
                        .padding()
                        
                        // Next Word Button
                        Button(action: {
                            game.loadNextWord() // Load next word
                            userGuess = "" // Clear input after moving to the next word
                        }) {
                            Text("Next Word")
                                .font(.custom("Avenir", size: 20))
                                .padding()
                                .background(Color.white)
                                .foregroundColor(.black)
                                .cornerRadius(10)
                        }
                        .padding()
                    }
                    
                    // User feedback
                    if game.guessedCorrectly {
                        Text("Correct!")
                            .foregroundColor(.white)
                            .font(.custom("Avenir", size: 22))
                            .padding(.bottom, -100)

                    } else if !userGuess.isEmpty {
                        Text("Try Again!") // Display only when the user has guessed something
                            .foregroundColor(.white)
                            .font(.custom("Avenir", size: 20))
                            .padding(.bottom, -100)
                    }
                    
                    
                    Spacer()
                }
                .padding()
            }
        }
    }
}

struct AnagramView_Previews: PreviewProvider {
    static var previews: some View {
        AnagramView()
    }
}

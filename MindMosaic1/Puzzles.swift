import SwiftUI

struct Puzzles: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 84 / 255, green: 08 / 255, blue: 04 / 255)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    // Home button with NavigationLink
                    HStack {
                        NavigationLink(destination: Home().navigationBarBackButtonHidden(true)) { // Navigate back to Home
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
                        Spacer() // Pushes home button to the left
                    }
                    .padding([.leading, .top], 25) // Align home button
                    
                    // Title
                    Text("Puzzles")
                        //.font(.largeTitle)
                        .font(.custom("Avenir-Heavy", size: 50))
                        .foregroundColor(.white)
                        .padding(.top, -70)
                    
                    Spacer() // Pushes content below the title
                    
                    // Button 1: Sudoku
                    HStack {
                        NavigationLink(destination: SudokuPuzzleView().navigationBarBackButtonHidden(true)) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(Color.white, lineWidth: 10)
                                        .frame(width: 200, height: 200) // Height for the button
                                    RoundedRectangle(cornerRadius: 25)
                                        .foregroundColor(Color(red: 183 / 225, green: 77 / 225, blue: 77 / 225))
                                        .frame(width: 200, height: 200) // Height for the button
                                    VStack {
                                        Spacer() // Pushes content down
                                        
                                        Text("Sudoku")
                                            .foregroundColor(.white)
                                            .font(.title)
                                            .font(.custom("Avenir", size: 28))
                                            .padding(.bottom, 25) // Optional: Add some bottom padding
                                                }
                                    Rectangle()
                                        .frame(width: 100, height: 5)
                                        .foregroundColor(.white)
                                        .opacity(0.6)
                                        .padding(.bottom, 40) // Optional: Add some bottom padding
                                    Rectangle()
                                        .frame(width: 5, height: 100)
                                        .foregroundColor(.white)
                                        .opacity(0.6)
                                        .padding(.bottom, 40) // Optional: Add some bottom padding
                                    Text("2")
                                        .foregroundColor(.white)
                                        .font(.title)
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                        .opacity(0.8)
                                        .padding(.bottom, 90)
                                        .padding(.leading, 50)
                                    Text("8")
                                        .foregroundColor(.white)
                                        .font(.title)
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                        .opacity(0.8)
                                        .padding(.bottom, -15)
                                        .padding(.leading, -35)
                                }
                                .padding(.horizontal, 40) // Center horizontally
                        }
                    }
                    
                    // Button 2: Jigsaw Puzzle
                    HStack {
                        NavigationLink(destination: AnagramView().navigationBarBackButtonHidden(true)) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.white, lineWidth: 10)
                                    .frame(width: 200, height: 200) // Height for the button
                                RoundedRectangle(cornerRadius: 25)
                                    .foregroundColor(Color(red: 183 / 225, green: 77 / 225, blue: 77 / 225))
                                    .frame(width: 200, height: 200)
                                    //.overlay(Text("Jigsaw Puzzle").foregroundColor(.white).font(.title))
                                VStack {
                                    Spacer() // Pushes content down
                                    Text("Anagrams")
                                        .foregroundColor(.white)
                                        .font(.custom("Avenir", size: 28))
                                        .font(.title)
                                        .padding(.bottom, 25) // Optional: Add some bottom padding
                                            }
                                HStack {
                                    Text("C")
                                        .foregroundColor(.white)
                                        .padding(5)
                                        .border(Color.white, width: 2)
                                        .font(.custom("Avenir-HEAVY", size: 28))
                                        .padding(.bottom, 95)
                                    Text("A")
                                        .foregroundColor(.white)
                                        .padding(5)
                                        .border(Color.white, width: 2)
                                        .font(.custom("Avenir-HEAVY", size: 28))
                                        .padding(.bottom, 95)
                                    Text("T")
                                        .foregroundColor(.white)
                                        .padding(5)
                                        .border(Color.white, width: 2)
                                        .font(.custom("Avenir-HEAVY", size: 28))
                                        .padding(.bottom, 95)
                                }
                                HStack {
                                    Text("T")
                                        .foregroundColor(.white)
                                        .padding(5)
                                        .border(Color.white, width: 2)
                                        .font(.custom("Avenir-HEAVY", size: 28))
                                        .padding(.bottom, -10)
                                    Text("A")
                                        .foregroundColor(.white)
                                        .padding(5)
                                        .border(Color.white, width: 2)
                                        .font(.custom("Avenir-HEAVY", size: 28))
                                        .padding(.bottom, -10)
                                    Text("C")
                                        .foregroundColor(.white)
                                        .padding(5)
                                        .border(Color.white, width: 2)
                                        .font(.custom("Avenir-HEAVY", size: 28))
                                        .padding(.bottom, -10)
                                }
                            }
                            .padding(.horizontal, 40)
                            .padding(.top, 20)
                        }
                    }
                    
                    // Button 3: Memory Matching
                    HStack {
                        NavigationLink(destination: MemoryMatchingView().navigationBarBackButtonHidden(true)) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.white, lineWidth: 10)
                                    .frame(width: 200, height: 200) // Height for the button
                                RoundedRectangle(cornerRadius: 25)
                                    .foregroundColor(Color(red: 183 / 225, green: 77 / 225, blue: 77 / 225))
                                    .frame(width: 200, height: 200)
                                VStack {
                                    Spacer() // Pushes content down
                                    Text("Memory Match")
                                        .font(.custom("Avenir", size: 28))
                                        .foregroundColor(.white)
                                        .font(.title)
                                        .padding(.bottom, 15) // Optional: Add some bottom padding
                                            }
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(.white)
                                        .frame(width: 40, height: 50) // Height for the button
                                        .opacity(0.7)
                                        .padding(.bottom, 100) // Optional: Add some bottom padding
                                        .padding(.leading, -50)
                                    ZStack {
                                        Image(systemName: "heart.fill")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 20, height: 42)
                                            .opacity(0.8)
                                            .foregroundColor(.red)
                                            .padding(.bottom, 95) // Optional: Add some bottom padding
                                            .padding(.leading, -40)
                                    }
                                    
                                }
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(.white)
                                        .frame(width: 40, height: 50) // Height for the button
                                        .opacity(0.7)
                                        .padding(.bottom, 100) // Optional: Add some bottom padding
                                        .padding(.leading, 70)
                                    RoundedRectangle(cornerRadius: 5)
                                        .foregroundColor(.red)
                                        .frame(width: 30, height: 40) // Height for the button
                                        .opacity(0.7)
                                        .padding(.bottom, 100) // Optional: Add some bottom padding
                                        .padding(.leading, 70)
                                    
                                }
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(.white)
                                        .frame(width: 40, height: 50) // Height for the button
                                        .opacity(0.7)
                                        .padding(.bottom, -20) // Optional: Add some bottom padding
                                        .padding(.leading, -50)
                                    RoundedRectangle(cornerRadius: 5)
                                        .foregroundColor(.red)
                                        .frame(width: 30, height: 40) // Height for the button
                                        .opacity(0.7)
                                        .padding(.bottom, -20) // Optional: Add some bottom padding
                                        .padding(.leading, -45)
                                    
                                }
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(.white)
                                        .frame(width: 40, height: 50) // Height for the button
                                        .opacity(0.7)
                                        .padding(.bottom, -20) // Optional: Add some bottom padding
                                        .padding(.leading, 70)
                                    ZStack {
                                        Image(systemName: "heart.fill")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 20, height: 42)
                                            .opacity(0.8)
                                            .foregroundColor(.red)
                                            .padding(.bottom, -25) // Optional: Add some bottom padding
                                            .padding(.leading, 70)
                                    }
                                    
                                }
                            }
                            .padding(.horizontal, 40)
                            .padding(.top, 20)
                        }
                    }
                    Spacer() // Pushes buttons toward the top
                }
            }
        }
    }
}

struct Puzzles_Previews: PreviewProvider {
    static var previews: some View {
        Puzzles()
    }
}

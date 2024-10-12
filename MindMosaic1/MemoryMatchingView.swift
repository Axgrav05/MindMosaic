//
//  MemoryMatchingView.swift
//  MindMosaic1
//
//  Created by Z on 10/12/24.
//

import SwiftUI

struct MemoryMatchingView: View {
    @ObservedObject var game = MemoryGame()
    
    var body: some View {
        NavigationView {
        ZStack {
        Color(red: 183 / 225, green: 77 / 225, blue: 77 / 225)
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
                
                Text("Matching")
                    .font(.custom("Avenir-Heavy", size: 50))
                    .foregroundColor(.white)
                    .padding(.top, -65)
                    .padding(.leading, 30)
                
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 20, height:50)
                
                
                LazyVGrid(columns: Array(repeating: GridItem(), count: 4)) {
                    ForEach(game.cards.indices, id: \.self) { index in
                        let card = game.cards[index]
                        CardView(card: card)
                            .onTapGesture {
                                game.flipCard(at: index)
                            }
                        }
                    }
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 20, height:150)
            }
            .padding()
            
            }
        }
    }
}

struct CardView: View {
    var card: Card

    var body: some View {
        ZStack {
            Rectangle()
                .fill(card.isFlipped || card.isMatched ? Color.black : Color.white)
                .stroke(Color(red: 214 / 255,green: 144 / 255, blue: 144 / 255), lineWidth: 10)
                .frame(width: 70, height: 100)
                .cornerRadius(10)
            Rectangle()
                .fill(card.isFlipped || card.isMatched ? Color.white : Color.white)
                .frame(width: 60, height: 90)
                .cornerRadius(10)

            if card.isFlipped || card.isMatched {
                Image(card.imageName)
                    .resizable()
                    .scaledToFill() // This makes sure the image fills the entire area
                    .frame(width: 60, height: 90)
                    .clipped() // This will ensure the image is clipped to the rectangle shape
                    .cornerRadius(10) // Keep consistent with the rectangle corners
            }
        }
    }
}


struct Card {
    let id: Int
    let imageName: String
    var isFlipped: Bool = false
    var isMatched: Bool = false
    
    // Add a computed property to get the SwiftUI Image
    var image: Image {
        Image(imageName)
    }
}

struct MemoryMatchingView_Previews: PreviewProvider {
    static var previews: some View {
        MemoryMatchingView()
    }
}

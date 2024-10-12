//
//  MemoryGame.swift
//  MindMosaic1
//
//  Created by Z on 10/13/24.
//

import Foundation
import Photos

class MemoryGame: ObservableObject {
    @Published var cards: [Card] = []
    @Published var firstFlippedIndex: Int? = nil
    @Published var secondFlippedIndex: Int? = nil

    init() {
        startGame()
    }

    func startGame() {
        // Initialize and shuffle cards
        let cardImages = ["butterfly_mosaic", "corn_mosaic", "horse_mosaic",
                          "pepper_mosaic", "sunset_mosaic", "apple_mosaic",
                          "plant_mosaic", "bird_mosaic"] // Add actual image names
        cards = cardImages.flatMap { imageName in
            [Card(id: cards.count, imageName: imageName),
             Card(id: cards.count + 1, imageName: imageName)]
        }.shuffled()
    }

    func flipCard(at index: Int) {
        guard !cards[index].isMatched else { return }

        if firstFlippedIndex == nil {
            firstFlippedIndex = index
            cards[index].isFlipped = true
        } else if secondFlippedIndex == nil {
            secondFlippedIndex = index
            cards[index].isFlipped = true
            checkForMatch()
        }
    }

    private func checkForMatch() {
        guard let firstIndex = firstFlippedIndex, let secondIndex = secondFlippedIndex else { return }
        if cards[firstIndex].imageName == cards[secondIndex].imageName {
            cards[firstIndex].isMatched = true
            cards[secondIndex].isMatched = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.cards[firstIndex].isFlipped = false
            self.cards[secondIndex].isFlipped = false
            self.firstFlippedIndex = nil
            self.secondFlippedIndex = nil
        }
    }
}

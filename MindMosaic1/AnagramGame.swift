//
//  AnagramGame.swift
//  MindMosaic1
//
//  Created by Z on 10/13/24.
//

import Foundation

class AnagramGame: ObservableObject {
    @Published var words: [AnagramWord] = []
    @Published var currentWord: String = ""
    @Published var scrambledWord: String = ""
    @Published var guessedCorrectly: Bool = false
    private var usedWords: Set<String> = [] // To keep track of used words

    init() {
        startGame()
    }

    func startGame() {
        // List of words for the game
        let anagramWords = [
            "listen",
            "silent",
            "triangle",
            "integral",
            "garden",
            "danger",
            "rescue",
            "secure",
            "return",
            "anagram",
            "stressed",
            "desserts",
            "evil",
            "vile",
            "heart",
            "earth",
            "earths",
            "relations",
            "creator",
            "elastic",
            "planner",
            "master",
            "stream",
            "isthmian",
            "flashier",
            "stretched",
            "recitals",
            "anagrams",
            "decaf",
            "crucible"
        ]

        // Initialize AnagramWord objects
        words = anagramWords.map { word in
            AnagramWord(original: word, scrambled: scramble(word))
        }

        // Start with a random word
        loadNextWord()
    }

    func loadNextWord() {
        guard words.count > 0 else {
            // Optionally, handle the game over condition
            return
        }

        // Pick a random word that hasn't been used yet
        if let randomWord = words.filter({ !usedWords.contains($0.original) }).randomElement() {
            currentWord = randomWord.original
            scrambledWord = randomWord.scrambled
            guessedCorrectly = false
            
            // Mark this word as used
            usedWords.insert(randomWord.original)
        } else {
            // All words have been used; reset for a new game
            usedWords.removeAll()
            loadNextWord()
        }
    }

    func guess(word: String) {
        // Check if the guessed word is correct
        if word.lowercased() == currentWord.lowercased() {
            guessedCorrectly = true
        } else {
            guessedCorrectly = false
        }
    }

    
    
    // Helper function to scramble the letters of a word
    private func scramble(_ word: String) -> String {
        return String(word.shuffled())
    }
}

struct AnagramWord {
    let original: String
    let scrambled: String
}

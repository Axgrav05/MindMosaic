//
//  SudokuPuzzleView.swift
//  MindMosaic1
//
//  Created by Z on 10/12/24.
//

//
//  SudokuPuzzleView.swift
//  MindMosaic1
//
//  Created by Z on 10/12/24.
//

//
//  SudokuPuzzleView.swift
//  MindMosaic1
//
//  Created by Z on 10/12/24.
//

import SwiftUI

// SudokuAPI.swift

struct SugokuAPI {
    static let baseUrl = "https://sugoku.onrender.com"
    static let generateUrl = baseUrl + "/board"
    static let solveUrl = baseUrl + "/solve"
    static let validateUrl = baseUrl + "/validate"
}

struct PuzzleResponse: Decodable {
    let board: [[Int]]
}

func fetchPuzzle(difficulty: String = "easy", completion: @escaping (PuzzleResponse?) -> Void) {
    guard let url = URL(string: "\(SugokuAPI.generateUrl)?difficulty=\(difficulty)") else { return }
    
    URLSession.shared.dataTask(with: url) { data, response, error in
        guard let data = data, error == nil else {
            print("Error fetching puzzle: \(error?.localizedDescription ?? "Unknown error")")
            completion(nil)
            return
        }
        
        do {
            let puzzleResponse = try JSONDecoder().decode(PuzzleResponse.self, from: data)
            completion(puzzleResponse)
        } catch {
            print("Error decoding puzzle data: \(error.localizedDescription)")
            completion(nil)
        }
    }.resume()
}

// SudokuPuzzleView.swift

struct SudokuPuzzleView: View {
    @State private var puzzle: [[Int]] = Array(repeating: Array(repeating: 0, count: 9), count: 9)
    @State private var editableCells: [[Bool]] = Array(repeating: Array(repeating: true, count: 9), count: 9)
    @State private var emptyCellsCount: Int = 81
    @State private var errorMessage: String?

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
                        
                        
                        Text("Sudoku")
                            .font(.custom("Avenir-Heavy", size: 50))
                            .foregroundColor(.white)
                            .padding (.leading, 25)
                            //.padding(.top, -100)
                        Spacer()
                    }
                    .padding(.top, -125)
                    .padding(.leading, 30)

                    VStack(spacing: 0) {
                        ForEach(0..<9, id: \.self) { row in
                            HStack(spacing: 0) {
                                ForEach(0..<9, id: \.self) { col in
                                    if editableCells[row][col] { // If the cell is editable
                                        TextField("", text: Binding(
                                            get: {
                                                puzzle[row][col] == 0 ? "" : "\(puzzle[row][col])"
                                            },
                                            set: { newValue in
                                                if let intValue = Int(newValue), (1...9).contains(intValue) {
                                                    puzzle[row][col] = intValue
                                                    updateEmptyCellsCount()
                                                } else if newValue.isEmpty {
                                                    puzzle[row][col] = 0
                                                    updateEmptyCellsCount()
                                                }
                                            }
                                        ))
                                        .multilineTextAlignment(.center)
                                        .frame(width: 40, height: 40)
                                        .border(Color.white)
                                        .font(.custom("Avenir", size: 30))
                                        .foregroundColor(.white)
                                        .keyboardType(.numberPad)
                                    } else {
                                        Text("\(puzzle[row][col])") // Display the fixed cell value
                                            .frame(width: 40, height: 40)
                                            .border(Color.white)
                                            .font(.custom("Avenir", size: 30))
                                            .foregroundColor(.white)
                                    }
                                }
                            }
                        }

                        if emptyCellsCount == 0 {
                            Text("Congratulations!")
                                .font(.custom("Avenir", size: 24))
                                .foregroundColor(.white)
                                .padding()
                        }

                        if let errorMessage = errorMessage {
                            Text(errorMessage)
                                .font(.custom("Avenir", size: 20))
                                .foregroundColor(.red)
                                .padding()
                        }

                        HStack(spacing: 30) {
                            Button(action: {
                                fetchPuzzle(difficulty: "easy") { response in
                                    if let response = response {
                                        DispatchQueue.main.async {
                                            self.puzzle = response.board
                                            self.updateEditableCells(response.board)
                                        }
                                    } else {
                                        DispatchQueue.main.async {
                                            self.errorMessage = "Failed to load easy puzzle."
                                        }
                                    }
                                }
                            }) {
                                Text("Easy")
                                    .font(.custom("Avenir", size: 28))
                                    .foregroundColor(.white)
                            }
                            
                            Button(action: {
                                fetchPuzzle(difficulty: "medium") { response in
                                    if let response = response {
                                        DispatchQueue.main.async {
                                            self.puzzle = response.board
                                            self.updateEditableCells(response.board)
                                        }
                                    } else {
                                        DispatchQueue.main.async {
                                            self.errorMessage = "Failed to load medium puzzle."
                                        }
                                    }
                                }
                            }) {
                                Text("Medium")
                                    .font(.custom("Avenir", size: 28))
                                    .foregroundColor(.white)
                            }
                            
                            Button(action: {
                                fetchPuzzle(difficulty: "hard") { response in
                                    if let response = response {
                                        DispatchQueue.main.async {
                                            self.puzzle = response.board
                                            self.updateEditableCells(response.board)
                                        }
                                    } else {
                                        DispatchQueue.main.async {
                                            self.errorMessage = "Failed to load hard puzzle."
                                        }
                                    }
                                }
                            }) {
                                Text("Hard")
                                    .font(.custom("Avenir", size: 28))
                                    .foregroundColor(.white)
                            }
                        }
                        .padding()
                    }
                }
            }
        }
    }
    
    private func updateEmptyCellsCount() {
        emptyCellsCount = puzzle.flatMap { $0 }.filter { $0 == 0 }.count
    }
    
    func updateEditableCells(_ board: [[Int]]) {
        for row in 0..<9 {
            for col in 0..<9 {
                editableCells[row][col] = board[row][col] == 0 // Editable if the value is 0
            }
        }
    }
}

struct SudokuPuzzleView_Previews: PreviewProvider {
    static var previews: some View {
        SudokuPuzzleView()
    }
}

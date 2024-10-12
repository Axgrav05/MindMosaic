import SwiftUI
import Foundation

struct Drawing: View {
    @State private var drawingPrompt: String = ""
    @State private var errorMessage: String? = nil
    @State private var isGenerating: Bool = false

    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 0 / 255, green: 42 / 255, blue: 34 / 255)
                    .edgesIgnoringSafeArea(.all)
                
                // Background animation
                AnimatedBackground()

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
                            .padding(.top, 70)
                        }
                        Spacer()
                    }
                    .padding(.leading)

                    Text("Create")
                        .font(.custom("Avenir-Heavy", size: 50))
                        .foregroundColor(.white)
                        .padding(.top, -65)
                    
                    Spacer()
                    
                    Button(action: generateRandomPrompt) {
                        Text(isGenerating ? "Generating..." : "Generate Drawing Prompt")
                            .font(.custom("Avenir-Heavy", size: 20))
                            .foregroundColor(.white)
                            .padding()
                            .background(Color(red: 98 / 255.0, green: 148 / 255.0, blue: 110 / 255.0))
                            .cornerRadius(8)
                    }
                    .disabled(isGenerating)
                    .padding(.bottom, 20)

                    if !drawingPrompt.isEmpty {
                        VStack {
                            Text("Your Drawing Prompt:")
                                .font(.custom("Avenir-Heavy", size: 15))
                                .foregroundColor(.white)
                            
                            Text(drawingPrompt)
                                .font(.custom("Avenir", size: 15))
                                .padding()
                                .background(Color.white.opacity(0.2))
                                .cornerRadius(8)
                                .foregroundColor(.white)
                        }
                        .padding()
                    }
                    
                    if let errorMessage = errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .padding()
                    }

                    Spacer()
                }
                .padding()
            }
            .edgesIgnoringSafeArea(.top)
        }
    }

    // Function to generate random drawing prompt
    func generateRandomPrompt() {
        isGenerating = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if let randomPrompt = drawingPrompts.randomElement() {
                drawingPrompt = randomPrompt
            } else {
                drawingPrompt = "No prompts available."
            }
            isGenerating = false
        }
    }
}

// Separate View for Background Animation
struct AnimatedBackground: View {
    let rows = 5
    let columns = 4
    let itemCount = 20
    
    // For animation
    @State private var animationValues: [CGSize] = Array(repeating: .zero, count: 20)

    var body: some View {
        GeometryReader { geometry in
            let itemWidth = geometry.size.width / CGFloat(columns)
            let itemHeight = geometry.size.height / CGFloat(rows)
            
            ForEach(0..<itemCount, id: \.self) { index in
                let row = index / columns
                let column = index % columns
                
                let x = itemWidth * (CGFloat(column) + 0.5)
                let y = itemHeight * (CGFloat(row) + 0.5)
                let isPaintbrush = Bool.random()
                let rotation = Angle(degrees: Double.random(in: -15...15))
                
                Image(systemName: isPaintbrush ? "paintbrush" : "music.note")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .position(x: x + animationValues[index].width,
                              y: y + animationValues[index].height)
                    .rotationEffect(rotation)
                    .opacity(0.2)
                    .foregroundColor(.white)
                    .onAppear {
                        animateBackgroundObject(at: index, in: geometry.size)
                    }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }

    // Function to animate background objects continuously
    func animateBackgroundObject(at index: Int, in size: CGSize) {
        let randomOffset = CGSize(width: CGFloat.random(in: -50...50), height: CGFloat.random(in: -50...50))
        withAnimation(Animation.easeInOut(duration: 5).repeatForever(autoreverses: true)) {
            animationValues[index] = randomOffset
        }
    }
}

struct Drawing_Previews: PreviewProvider {
    static var previews: some View {
        Drawing()
    }
}

import SwiftUI

struct Home: View {
    @State private var showCreativity = false
    @State private var showPuzzles = false
    @State private var showJournal = false

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(red: 33 / 255, green: 1 / 255, blue: 36 / 255), Color(red: 33 / 255, green: 1 / 255, blue: 36 / 255), Color.black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Image("1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
                
                Text("Mind Mosaic")
                    .font(.custom("Avenir-Heavy", size: 50))
                    .foregroundColor(.white)


                Button(action: {
                    showCreativity = true
                }) {
                    homeButtonView(iconName: "paintpalette.fill", label: "Creativity")
                }
                .fullScreenCover(isPresented: $showCreativity) {
                    Drawing().navigationBarBackButtonHidden(true)
                }
                .frame(height: 80)
                
                Button(action: {
                    showPuzzles = true
                }) {
                    homeButtonView(iconName: "puzzlepiece.fill", label: "Logic & Puzzles")
                }
                .fullScreenCover(isPresented: $showPuzzles) {
                    Puzzles().navigationBarBackButtonHidden(true)
                }
                .frame(height: 80)

                Button(action: {
                    showJournal = true
                }) {
                    homeButtonView(iconName: "book.fill", label: "Journal")
                }
                .fullScreenCover(isPresented: $showJournal) {
                    Journal().navigationBarBackButtonHidden(true)
                }
                .frame(height: 80)

                Button(action: {
                    callEmergencyNumber()
                }) {
                    ZStack {
                        Rectangle()
                            .fill(LinearGradient(gradient: Gradient(colors: [Color.red.opacity(0.6), Color.white.opacity(0.3)]),
                                                 startPoint: .topLeading,
                                                 endPoint: .bottomTrailing))
                            .cornerRadius(15)
                            .shadow(color: Color.black.opacity(0.4), radius: 8, x: 4, y: 6)
                        
                        HStack {
                            Image(systemName: "phone.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.white)
                            
                            Text("Emergency")
                                .font(.custom("Avenir-Heavy", size: 25))
                                .foregroundColor(.white)
                                .padding(.leading, 10)
                        }
                    }
                }
                .frame(height: 70)
                .padding(.horizontal)
                .padding(.bottom, 20)
            }
            .padding(.horizontal, 16)
        }
    }
    
    private func homeButtonView(iconName: String, label: String) -> some View {
        ZStack {
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color.purple.opacity(0.6), Color.white.opacity(0.3)]),
                                     startPoint: .topLeading,
                                     endPoint: .bottomTrailing))
                .cornerRadius(15)
                .shadow(color: Color.black.opacity(0.4), radius: 8, x: 4, y: 6)

            HStack {
                Image(systemName: iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .foregroundColor(.white)

                Text(label)
                    .font(.custom("Avenir-Heavy", size: 35))
                    .foregroundColor(.white)
                    .padding(.leading, 10)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 100)
        .padding(.horizontal)
    }
    
    // Call 911 function
    private func callEmergencyNumber() {
        let emergencyNumber = "911"
        if let url = URL(string: "tel://\(emergencyNumber)"), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            print("Unable to make the call on this device.")
        }
    }
}

#Preview {
    Home()
}

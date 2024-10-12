import SwiftUI
import FirebaseAuth

struct SignIn: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String = ""
    @State private var isSignedIn: Bool = false
    @State private var isLoading: Bool = false

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(red: 33 / 255, green: 1 / 255, blue: 36 / 255), Color(red: 33 / 255, green: 1 / 255, blue: 36 / 255), Color.black]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    Spacer()
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .padding(.bottom, 20)
                        .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)

                    Text("Sign In")
                        .font(.custom("Avenir-Heavy", size: 35))
                        .padding()
                        .foregroundStyle(.white)

                    Group {
                        TextField("Email", text: $email)
                            .font(.custom("Avenir", size: 18))
                            .padding()
                            .background(Color.white.opacity(0.9))
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                            .autocapitalization(.none)
                            .keyboardType(.emailAddress)
                            .padding(.horizontal, 16)
                            .frame(maxWidth: 400)

                        SecureField("Password", text: $password)
                            .font(.custom("Avenir", size: 18))
                            .padding()
                            .background(Color.white.opacity(0.9))
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                            .autocapitalization(.none)
                            .keyboardType(.emailAddress)
                            .padding(.horizontal, 16)
                            .frame(maxWidth: 400)
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 5)

                    if !errorMessage.isEmpty {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .font(.custom("Avenir", size: 16))
                            .padding(.bottom, 10)
                            .multilineTextAlignment(.center)
                    }

                    if isLoading {
                        ProgressView("Signing In...")
                            .progressViewStyle(CircularProgressViewStyle())
                            .foregroundColor(.white)
                            .padding(.top, 10)
                    }

                    HStack {
                        Spacer()
                        NavigationLink(destination: SignUp().navigationBarBackButtonHidden(true)) {
                            Text("Don't have an account? Sign Up")
                                .font(.custom("Avenir", size: 14))
                                .foregroundColor(.white)
                                .underline()
                                .font(.footnote)
                                .padding(.bottom, 10)
                                .padding(.trailing, 15)
                        }
                    }
                    .padding(.horizontal, 16)
                    .frame(maxWidth: 400, alignment: .trailing)
                    
                    
                    NavigationLink(destination: Home().navigationBarBackButtonHidden(true), isActive: $isSignedIn) {
                        EmptyView()
                    }

                    HStack {
                        Button(action: {
                            signIn()
                        }) {
                            Text("Sign In")
                                .font(.custom("Avenir-Heavy", size: 18))
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: 400)
                                .background(LinearGradient(gradient: Gradient(colors: [Color.pink, Color.purple]), startPoint: .leading, endPoint: .trailing))
                                .cornerRadius(12)
                                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                        }
                        .buttonStyle(ScaleButtonStyle())
                    }
                    .frame(maxWidth: 400)
                    .padding(.horizontal, 16)
                    .padding(.top, 20)

                    Spacer()
                }
                .padding()
            }
        }
    }

    func signIn() {
        isLoading = true
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            isLoading = false
            if let error = error {
                self.errorMessage = error.localizedDescription
            } else {
                self.errorMessage = ""
                self.isSignedIn = true // Trigger navigation to HomeView
            }
        }
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}


struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}


import SwiftUI
import FirebaseAuth

struct SignUp: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String = ""
    @State private var isAccountCreated: Bool = false // Used to trigger navigation
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

                    Text("Sign Up")
                        .font(.custom("Avenir-Heavy", size: 50))
                        .foregroundColor(.white)
                        .padding()

                    // Input fields
                    VStack(spacing: 16) {
                        // Email field
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
                            .frame(maxWidth: 400)

                        // Password field
                        SecureField("Password", text: $password)
                            .font(.custom("Avenir", size: 18))
                            .padding()
                            .background(Color.white.opacity(0.9))
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                            .frame(maxWidth: 400)
                    }
                    .padding(.horizontal, 16)

                    // Error message
                    if !errorMessage.isEmpty {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .font(.custom("Avenir", size: 16))
                            .padding(.top, 10)
                            .multilineTextAlignment(.center)
                    }

                    // Loading indicator
                    if isLoading {
                        ProgressView("Creating Account...")
                            .progressViewStyle(CircularProgressViewStyle())
                            .foregroundColor(.white)
                            .padding(.top, 10)
                    }

                    // NavigationLink to go back to SignIn page after successful account creation
                    NavigationLink(destination: SignIn().navigationBarBackButtonHidden(true), isActive: $isAccountCreated) {
                        EmptyView()
                    }

                    // Create Account Button
                    HStack {
                        Button(action: {
                            createAccount()
                        }) {
                            Text("Create Account")
                                .font(.custom("Avenir-Heavy", size: 18))
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: 400) // Match button width with text fields
                                .background(LinearGradient(gradient: Gradient(colors: [Color.pink, Color.purple]), startPoint: .leading, endPoint: .trailing))
                                .cornerRadius(12)
                                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                        }
                        .buttonStyle(ScaleButtonStyle())
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 20)

                    Spacer()
                }
                .padding()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }

    // Firebase Sign Up Function
    func createAccount() {
        isLoading = true
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            isLoading = false
            if let error = error {
                self.errorMessage = error.localizedDescription
            } else {
                self.errorMessage = ""
                self.isAccountCreated = true // Trigger navigation back to SignIn view
            }
        }
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}

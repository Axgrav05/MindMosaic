import SwiftUI

struct JournalEntryDetail: View {
    var entry: (id: UUID, date: String, title: String, entry: String) // Accept the entry as a single tuple
    @Binding var journalEntries: [(id: UUID, date: String, title: String, entry: String)]
    @Environment(\.presentationMode) var presentationMode

    init(entry: (id: UUID, date: String, title: String, entry: String), journalEntries: Binding<[(id: UUID, date: String, title: String, entry: String)]>) {
        self.entry = entry
        self._journalEntries = journalEntries

        // Set navigation bar appearance to white
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.clear // Transparent background to match your design
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white] // White title text color

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }

    var body: some View {
        ZStack {
            // Full blue background
            LinearGradient(gradient: Gradient(colors: [Color(red: 45 / 255, green: 45 / 255, blue: 112 / 255), Color(red: 16 / 255, green: 16 / 255, blue: 70 / 255)]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)

            VStack {
                // Display the content
                VStack(spacing: 20) {
                    // Display the date of the entry
                    Text(entry.date)
                        .font(.custom("Avenir-Heavy", size: 22))
                        .foregroundColor(.white) // White text
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)

                    // Display the title of the entry
                    Text(entry.title)
                        .font(.custom("Avenir-Heavy", size: 30))
                        .foregroundColor(.white) // White text
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)

                    // Display the entry text
                    Text(entry.entry)
                        .font(.custom("Avenir", size: 18))
                        .foregroundColor(.white.opacity(0.9)) // Slightly dimmed white for body text
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                .frame(maxWidth: .infinity, alignment: .center) // Center horizontally
                .padding()

                Spacer() // Push the delete button to the bottom

                // Delete Button at the bottom center
                Button(action: {
                    if let index = journalEntries.firstIndex(where: { $0.id == entry.id }) {
                        journalEntries.remove(at: index) // Remove the entry from the array
                        saveEntries() // Save the updated array to UserDefaults
                        presentationMode.wrappedValue.dismiss() // Dismiss the detail view
                    }
                }) {
                    Image(systemName: "trash")
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red) // Red background for delete button
                        .clipShape(Circle()) // Circular shape for the trash button
                }
                .frame(maxWidth: .infinity, alignment: .center) // Center horizontally
                .padding(.bottom, 30) // Add padding at the bottom
            }
            .navigationTitle("Journal Entry") // Set the navigation title
            .navigationBarTitleDisplayMode(.inline) // Use inline to center it in the navigation bar
        }
    }

    // Function to save the updated journal entries to UserDefaults
    func saveEntries() {
        let data = journalEntries.map { ["id": $0.id.uuidString, "date": $0.date, "title": $0.title, "entry": $0.entry] }
        UserDefaults.standard.set(data, forKey: "JournalEntries")
    }
}

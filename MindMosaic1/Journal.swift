import SwiftUI

struct Journal: View {
    @State private var journalEntries: [(id: UUID, date: String, title: String, entry: String)] = []
    @State private var showingEntryPage = false

    var body: some View {
        NavigationView {
            ZStack {
                // Modern Gradient Background
                LinearGradient(gradient: Gradient(colors: [Color(red: 16 / 255, green: 16 / 255, blue: 70 / 255), Color(red: 45 / 255, green: 45 / 255, blue: 112 / 255), Color.black]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    // Home Button
                    HStack {
                        NavigationLink(destination: Home().navigationBarBackButtonHidden(true)) {
                            Image(systemName: "house.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                                .padding(10)
                                .background(Circle().stroke(Color.white, lineWidth: 3))
                        }
                        .padding(.leading, 30)

                        Spacer()
                    }
                    .padding(.top, 20)
                    
                    // Title
                    Text("Journal")
                        .font(.custom("Avenir-Heavy", size: 34))
                        .foregroundColor(.white)
                        .padding(.top, -55)

                    // Journal Entries List
                    ScrollView {
                        VStack(spacing: 20) {
                            ForEach(journalEntries, id: \.id) { entry in
                                NavigationLink(destination: JournalEntryDetail(entry: entry, journalEntries: $journalEntries)) {
                                    JournalEntryCard(date: entry.date, title: entry.title, entryText: entry.entry)
                                        .padding(.horizontal, 16) // Horizontal padding to control width
                                }
                            }
                        }
                        .frame(maxWidth: .infinity) // Make the container full-width
                    }

                    Spacer()

                    // Add Entry Button (Floating Button)
                    Button(action: {
                        showingEntryPage = true
                    }) {
                        Image(systemName: "plus")
                            .font(.largeTitle)
                            .padding(20)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
                    }
                    .padding(.bottom, 30)
                }
                // Sheet to add a new journal entry
                .sheet(isPresented: $showingEntryPage) {
                    JournalEntryForm(journalEntries: $journalEntries, onSave: saveEntries)
                }
                .onAppear(perform: loadEntries)
            }
        }
    }

    // Save journal entries to UserDefaults
    func saveEntries() {
        let data = journalEntries.map { ["id": $0.id.uuidString, "date": $0.date, "title": $0.title, "entry": $0.entry] }
        UserDefaults.standard.set(data, forKey: "JournalEntries")
    }

    // Load journal entries from UserDefaults
    func loadEntries() {
        if let savedEntries = UserDefaults.standard.array(forKey: "JournalEntries") as? [[String: String]] {
            journalEntries = savedEntries.compactMap { dict in
                if let idString = dict["id"], let id = UUID(uuidString: idString),
                   let date = dict["date"], let title = dict["title"], let entry = dict["entry"] {
                    return (id: id, date: date, title: title, entry: entry)
                }
                return nil
            }
        }
    }
}


import SwiftUI

struct JournalEntryForm: View {
    @Binding var journalEntries: [(id: UUID, date: String, title: String, entry: String)]
    @Environment(\.presentationMode) var presentationMode
    @State private var entryText = ""
    @State private var entryTitle = ""
    @State private var entryDate = Date()

    var onSave: () -> Void

    init(journalEntries: Binding<[(id: UUID, date: String, title: String, entry: String)]>, onSave: @escaping () -> Void) {
        self._journalEntries = journalEntries
        self.onSave = onSave
        
        // Set navigation bar appearance
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(Color(red: 45 / 255, green: 45 / 255, blue: 112 / 255))
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }

    var body: some View {
        NavigationView {
            ZStack {
                // Full blue background
                LinearGradient(gradient: Gradient(colors: [Color(red: 45 / 255, green: 45 / 255, blue: 112 / 255), Color(red: 16 / 255, green: 16 / 255, blue: 70 / 255)]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)

                VStack(spacing: 20) {
                    // Title and Entry fields
                    VStack(spacing: 20) {
                        // Date picker for selecting the entry date
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Date")
                                .font(.custom("Avenir", size: 16))
                                .foregroundColor(.white)
                            DatePicker("", selection: $entryDate, displayedComponents: .date)
                                .datePickerStyle(GraphicalDatePickerStyle()) // Cleaner graphical date picker
                                .colorScheme(.dark) // Dark mode to suit the blue background
                                .background(Color.blue.opacity(0.2))
                                .cornerRadius(10)
                        }
                        .padding(.horizontal)

                        // Title Input
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Title")
                                .font(.custom("Avenir", size: 16))
                                .foregroundColor(.white)

                            TextField("Enter title", text: $entryTitle)
                                .padding(10)
                                .background(Color.blue.opacity(0.3)) // Use a light blue color for the entry box
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .font(.custom("Avenir", size: 18))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.white.opacity(0.4), lineWidth: 1)
                                )
                        }
                        .padding(.horizontal)

                        // Entry Text Area
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Entry")
                                .font(.custom("Avenir", size: 16))
                                .foregroundColor(.white)

                            ZStack {
                                Color.blue.opacity(0.3) // Blue background
                                    .cornerRadius(10)
                                TextEditor(text: $entryText)
                                    .padding(10)
                                    .foregroundColor(.black)
                                    .font(.custom("Avenir", size: 16))
                            }
                            .frame(minHeight: 150) // Minimum height for the text box
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.white.opacity(0.4), lineWidth: 1)
                            )
                        }
                        .padding(.horizontal)
                    }

                    Spacer()

                    // Save Button
                    Button(action: {
                        let formatter = DateFormatter()
                        formatter.dateStyle = .medium
                        let newEntry = (id: UUID(), date: formatter.string(from: entryDate), title: entryTitle, entry: entryText)
                        journalEntries.append(newEntry)
                        onSave()
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Save")
                            .font(.custom("Avenir-Heavy", size: 18))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                    .padding(.bottom, 120) // Reduced padding to bring it higher

                    // Cancel Button
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Cancel")
                            .font(.custom("Avenir-Heavy", size: 18))
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white.opacity(0.2))
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                }
                .padding(.vertical, 20)
            }
            .navigationBarTitle("New Journal Entry", displayMode: .inline)
            .foregroundColor(.white) // Ensure the title text is white
        }
    }
}





struct JournalEntryCard: View {
    var date: String
    var title: String
    var entryText: String

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Entry Date
            Text(date)
                .font(.custom("Avenir-Heavy", size: 16))
                .foregroundColor(.white.opacity(0.9))
                .padding(.bottom, 4) // Separate the date from the title

            // Entry Title
            Text(title)
                .font(.custom("Avenir-Heavy", size: 24))
                .foregroundColor(.white)
                .lineLimit(1) // Limit title to 1 line

            // Divider for visual separation
            Divider()
                .background(Color.white.opacity(0.4))

            // Entry Text Preview (truncated)
            Text(entryText)
                .font(.custom("Avenir", size: 16))
                .foregroundColor(.white.opacity(0.8))
                .lineLimit(2) // Show only the first two lines
                .truncationMode(.tail) // Truncate text at the end if it exceeds two lines
        }
        .padding(16) // Consistent padding for the whole card
        .background(
            ZStack {
                // Gradient Background
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.8), Color.purple.opacity(0.6)]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)

                // Subtle Overlay for better readability
                Color.black.opacity(0.2)
            }
        )
        .cornerRadius(20) // Smoother, larger corner radius for a modern look
        .shadow(color: Color.black.opacity(0.5), radius: 8, x: 0, y: 5) // Slightly deeper shadow
        .frame(minWidth: 350, maxWidth: 350, minHeight: 140, maxHeight: 140) // Adjusted dimensions
    }
}


// Preview
struct Journal_Previews: PreviewProvider {
    static var previews: some View {
        Journal()
    }
}

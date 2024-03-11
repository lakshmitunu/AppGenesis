

import SwiftUI

struct ContentView: View {
    @ObservedObject var apiStore = APIStore()
    @State private var expandedCategories = Set<String>()
    
    var categories: [String] {
        return Array(Set(apiStore.apiData?.entries.map { $0.Category } ?? [])).sorted()
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(categories, id: \.self) { category in
                    Section(header:
                        Button(action: {
                            if expandedCategories.contains(category) {
                                expandedCategories.remove(category)
                            } else {
                                expandedCategories.insert(category)
                            }
                        }) {
                            HStack(spacing: 10) {
                                Text(category)
                                    .font(.subheadline)
                                Spacer()
                                Image(systemName: expandedCategories.contains(category) ? "chevron.up" : "chevron.down")
                                    .font(.headline)
                            }
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(10)
                        }
                      .listRowInsets(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15)) 
                    ) {
                        if expandedCategories.contains(category) {
                            APIListView(apiEntries: apiStore.apiData?.entries.filter { $0.Category == category } ?? [])
                        }
                    }
                    .padding(.top, 0)
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("CATEGORY API LIST")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct APIListView: View {
    var apiEntries: [APIEntry]
    
    var body: some View {
        ForEach(apiEntries, id: \.id) { apiEntry in
            NavigationLink(destination: APIDetailView(apiEntry: apiEntry)) {
                Text(apiEntry.API)
                    .font(.subheadline)
            }
        }
    }
}



struct APIDetailView: View {
    var apiEntry: APIEntry
    
    var body: some View {
        Form {
            Section(header: Text("API Details").font(.headline)) {
                VStack(alignment: .leading, spacing: 15) {
                    TextRow(title: "API Name", value: apiEntry.API)
                    TextRow(title: "Description", value: apiEntry.Description)
                    TextRow(title: "Authentication", value: apiEntry.Auth)
                    TextRow(title: "HTTPS", value: apiEntry.HTTPS ? "Yes" : "No")
                    TextRow(title: "CORS Support", value: apiEntry.Cors)
                    TextRow(title: "Link", value: apiEntry.Link)
                    TextRow(title: "Category", value: apiEntry.Category)
                }
            }
        }
        .navigationTitle(apiEntry.API)
    }
}

struct TextRow: View {
    var title: String
    var value: String
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Text(value)
                .foregroundColor(.blue)
        }
    }
}

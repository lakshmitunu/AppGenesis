

import Foundation

class APIStore: ObservableObject {
    @Published var apiData: APIModel?
    
    init() {
        loadAPIData()
    }
    
    private func loadAPIData() {
        if let fileURL = Bundle.main.url(forResource: "apilist", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileURL)
                let decoder = JSONDecoder()
                apiData = try decoder.decode(APIModel.self, from: data)
            } catch {
                print("Error loading data from app bundle: \(error.localizedDescription)")
            }
        } else {
            print("API data file not found in app bundle.")
            if let documentDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                let fileURL = documentDirectoryURL.appendingPathComponent("apilist.json")
                do {
                    let data = try Data(contentsOf: fileURL)
                    let decoder = JSONDecoder()
                    apiData = try decoder.decode(APIModel.self, from: data)
                } catch {
                    print("Error loading data from document directory: \(error.localizedDescription)")
                }
            } else {
                print("Document directory not found.")
            }
        }
    }
    
    func saveAPIDataToFile() {
        if let apiData = apiData {
            do {
                let encoder = JSONEncoder()
                let data = try encoder.encode(apiData)
                if let documentDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                    let fileURL = documentDirectoryURL.appendingPathComponent("api_data.json")
                    try data.write(to: fileURL)
                    print("API data saved to file.")
                } else {
                    print("Document directory not found.")
                }
            } catch {
                print("Error saving data to file: \(error.localizedDescription)")
            }
        } else {
            print("No API data to save.")
        }
    }
}

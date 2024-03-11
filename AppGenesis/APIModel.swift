

import Foundation

struct APIModel: Codable {
    let count: Int
    let entries: [APIEntry]
}

struct APIEntry: Codable, Identifiable {
    let id = UUID()
    var API: String
    var Description: String
    var Auth: String
    var HTTPS: Bool
    var Cors: String
    var Link: String
    var Category: String
}

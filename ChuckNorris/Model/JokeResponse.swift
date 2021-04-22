import Foundation

struct JokeResponse: Decodable {
    let type: String
    let jokes: [Joke]
    
    private enum CodingKeys: String, CodingKey {
        case type
        case jokes = "value"
    }
}

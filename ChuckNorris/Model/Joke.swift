import UIKit

struct Joke: Decodable {
    let id: Int
    let content: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case content = "joke"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(Int.self, forKey: .id)
        self.content = try container.decode(String.self, forKey: .content).escapedHTML
    }
}

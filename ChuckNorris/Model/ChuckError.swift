import Foundation

enum ChuckError: LocalizedError {
    case loadingFailed
    case decodingFailed
    
    public var errorDescription: String? {
        switch self {
        case .loadingFailed:
            return "Failed to load jokes"
        case .decodingFailed:
            return "Failed to decode jokes"
        }
    }
}

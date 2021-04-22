import Foundation
@testable import ChuckNorris

class MockJokeService: JokeServiceType {
    let isSuccessful: Bool

    init(isSuccessful: Bool) {
        self.isSuccessful = isSuccessful
    }
    
    func getJokes(with limit: Int, excludedCategories: [String], completion: @escaping ((Result<[Joke], Error>) -> Void)) {
        if isSuccessful {
            completion(.success(jokes!))
        } else {
            completion(.failure(ChuckError.loadingFailed))
        }
    }
    
    let jokes = FileDeserialiser.getObject(from: "Jokes", returningClass: JokeResponse.self)?.jokes
}

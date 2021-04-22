import Foundation

protocol JokeServiceType {
    func getJokes(with limit: Int, excludedCategories: [String], completion: @escaping ((Result<[Joke], Error>) -> Void))
}

class JokeService: JokeServiceType {
    func getJokes(with limit: Int, excludedCategories: [String], completion: @escaping ((Result<[Joke], Error>) -> Void)) {
        guard let url = URLBuilder.build(limit: limit, excludedCategories: excludedCategories) else {
            print("failed to download Jokes")
            completion(.failure(ChuckError.loadingFailed))
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("failed to download Jokes: \(error.localizedDescription)")
                completion(.failure(ChuckError.loadingFailed))
            }
            
            if let data = data {
                let jsonDecoder = JSONDecoder()
                do {
                    let jokesResponse = try jsonDecoder.decode(JokeResponse.self, from: data)
                    completion(.success(jokesResponse.jokes))
                } catch {
                    completion(.failure(ChuckError.decodingFailed))
                }
            }
        }.resume()
    }
}

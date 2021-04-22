import UIKit

typealias Category = String

class JokeListViewModel {
    let service: JokeServiceType
    private var jokes = [Joke]()
    private var limit = 20
    private var excludedCategories: [Category] = ["explicit"]
    
    init(jokesService: JokeServiceType = JokeService()) {
        service = jokesService
    }
    
    func fetchData(completion: @escaping () -> Void, failure: @escaping (Error) -> Void) {
        service.getJokes(with: limit, excludedCategories: excludedCategories) { result in
            do {
                self.jokes = try result.get()
                completion()
            } catch {
                failure(error)
            }
        }
    }
    
    var numberOfCells: Int {
        jokes.count
    }
    
    func joke(at index: Int) -> Joke {
        return jokes[index]
    }
}

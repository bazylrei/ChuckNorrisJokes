import Foundation
@testable import ChuckNorris

class FileDeserialiser: NSObject {
    static func getObject<T: Decodable>(from fileName: String, returningClass: T.Type) -> T? {
        if let path = Bundle(for: self).path(forResource: fileName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonDecoder = JSONDecoder()
                let response = try jsonDecoder.decode(returningClass, from: data)
                return response
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
}

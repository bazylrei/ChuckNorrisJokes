import Foundation

struct URLBuilder {
    private static let host = "http://api.icndb.com/jokes"
    private static let random = "random"
    
    private static func exclude(categories: [String]) -> String {
        let categoriesString = categories.joined(separator: ",")
        return "exclude=[\(categoriesString)]"
    }
    
    static func build(limit: Int, excludedCategories: [String]) -> URL? {
        var urlString = "\(host)/\(random)/\(limit)"
        if !excludedCategories.isEmpty {
            urlString.append("?\(exclude(categories: excludedCategories))")
        }
        return URL(string: urlString)
    }
}

import UIKit

class JokeCell: UITableViewCell {
    static let identifier = String(describing: type(of: self))
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(with joke: Joke) {
        textLabel?.text = joke.content
    }
    
    private func setupUI() {
        textLabel?.translatesAutoresizingMaskIntoConstraints = false
        textLabel?.textAlignment = .left
        textLabel?.numberOfLines = 0
        textLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .ultraLight)
        textLabel?.adjustsFontSizeToFitWidth = true
        
        textLabel?.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Dimensions.marginSize).isActive = true
        textLabel?.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -2 * Dimensions.marginSize).isActive = true
        textLabel?.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Dimensions.marginSize).isActive = true
        textLabel?.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 1.0).isActive = true
    }
    
    private struct Dimensions {
        static let marginSize = CGFloat(12.0)
        static let imageDimension = CGFloat(40.0)
    }
}

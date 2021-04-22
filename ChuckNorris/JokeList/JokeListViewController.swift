import UIKit

class JokeListViewController: UITableViewController {
    private let viewModel: JokeListViewModel
    private let router: Routing
    
    init(viewModel: JokeListViewModel, router: Routing) {
        self.viewModel = viewModel
        self.router = router
        super.init(nibName: nil, bundle: nil)
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Chuck Norris Jokes"
        reload()
    }
    
    private func setupTableView() {
        tableView.register(JokeCell.self, forCellReuseIdentifier: JokeCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(reload), for: .valueChanged)
    }
    
    @objc private func reload() {
        viewModel.fetchData(completion: { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.refreshControl?.endRefreshing()
                self?.tableView.reloadData()
            }
        }, failure: { [weak self] error in
            guard let self = self else {
                fatalError()
            }
            DispatchQueue.main.async {
                self.router.presentError(error) { _ in
                    self.tableView.refreshControl?.endRefreshing()
                }
            }
        })
    }
}

extension JokeListViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCells
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: JokeCell.identifier) as? JokeCell else {
            fatalError("Error - did not find Joke Cell")
        }
        let joke = viewModel.joke(at: indexPath.row)
        cell.setup(with: joke)
        return cell
    }
}

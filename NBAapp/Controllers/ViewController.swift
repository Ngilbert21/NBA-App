//
//  ViewController.swift
//  NBAapp
//
//  Created by Nicholas Gilbert on 8/20/21.
//

import UIKit

class StadiumListViewController: UIViewController {
    
    // MARK: - privates properties
    private var stadiums = [Stadium]()
    private var networkManager = NetworkManager()

    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getStadiums()
    }
    
    // MARK: - privates funcs
    private func getStadiums() {
        
        networkManager.getStadiums(from:NetworkURL.stadiums, completion: { [weak self] result in
            switch result {
            case .success(let stadiums):
                self?.stadiums = stadiums
                self?.tableView.reloadData()
            case . failure(let error):
                self?.showErrorAlert(message: error.localizedDescription)
            }
        })
    }

    private func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let acceptButton = UIAlertAction(title: "Accept", style: .default)
        alert.addAction(acceptButton)
        present(alert, animated: true)
    }

}

// MARK: - UITableViewDataSource
extension StadiumListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stadiums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StadiumCell.identifier, for: indexPath) as? StadiumCell
        else { return UITableViewCell() }
        
        let row = indexPath.row
        let stadium = stadiums[row]
        cell.configureCell(name: stadium.name, address: stadium.address, city: stadium.city, state: stadium.state, zip: stadium.zip)
        
        return cell
    }
    
}

// MARK: - UITableViewDelegate
extension StadiumListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

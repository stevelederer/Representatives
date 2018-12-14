//
//  StateDetailTableViewController.swift
//  Representatives
//
//  Created by Steve Lederer on 12/13/18.
//  Copyright © 2018 Steve Lederer. All rights reserved.
//

import UIKit

class StateDetailTableViewController: UITableViewController {
    
    // MARK: - Properties
    var representatives: [Representative] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView?.reloadData()
            }
        }
    }
    var state: String?
    
    // MARK: - View Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if let state = state {
            self.title = "\(state) Representatives"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let state = state {
            RepresentativeController.searchRepresentatives(forState: state) { (representatives) in
                if let representatives = representatives {
                    self.representatives = representatives
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return representatives.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepresentativeCell", for: indexPath) as! RepresentativeTableViewCell
        let repsentative = representatives[indexPath.row]
        cell.representative = repsentative
        return cell
    }
}

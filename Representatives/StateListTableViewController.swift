//
//  StateListTableViewController.swift
//  Representatives
//
//  Created by Steve Lederer on 12/13/18.
//  Copyright © 2018 Steve Lederer. All rights reserved.
//

import UIKit

class StateListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return States.sortedStates.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StateCell", for: indexPath)
        let stateName = States.sortedStates[indexPath.row]
        cell.textLabel?.text = stateName
        return cell
    }
 
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? StateDetailTableViewController, let selectedIndex = tableView.indexPathForSelectedRow?.row {
            let state = States.sortedStates[selectedIndex]
            destinationViewController.state = state
        }
    }
    

}

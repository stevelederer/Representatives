//
//  RepresentativeTableViewCell.swift
//  Representatives
//
//  Created by Steve Lederer on 12/13/18.
//  Copyright © 2018 Steve Lederer. All rights reserved.
//

import UIKit

class RepresentativeTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    // MARK: - Dependency
    var representative: Representative? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - Setup
    func updateViews() {
        guard let representative = representative else { return }
        DispatchQueue.main.async {
            self.nameLabel.text = representative.name
            self.partyLabel.text = representative.party
            self.districtLabel.text = representative.district
            self.websiteLabel.text = representative.link
            self.phoneLabel.text = representative.phone
        }
    }
}

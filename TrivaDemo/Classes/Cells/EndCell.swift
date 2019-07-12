//
//  EndCell.swift
//  TrivaDemo
//
//  Created by kushal on 09/07/19.
//  Copyright © 2019 ajeet. All rights reserved.
//

import UIKit

class EndCell: UITableViewCell {

    @IBOutlet var lblDate: UILabel!
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblFirstAnswer: UILabel!
    @IBOutlet var lblSecondAnswer: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

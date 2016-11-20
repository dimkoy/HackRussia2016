//
//  MealTableViewCell.swift
//  HackRussia2016
//
//  Created by Dmitriy on 20/11/2016.
//  Copyright © 2016 Dmitriy. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {

    @IBOutlet weak var coordinateLabel: UILabel!
    @IBOutlet weak var foodView: UITextView!
    @IBOutlet weak var commentView: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

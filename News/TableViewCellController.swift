//
//  TableViewCellController.swift
//  News
//
//  Created by  User on 08.02.2022.
//  Copyright © 2022 abr. All rights reserved.
//

import UIKit

class TableViewCellController: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imgURL: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  BookmarkTableViewCell.swift
//  Openstax
//
//  Created by Michael Harrison on 8/30/16.
//  Copyright © 2016 Openstax. All rights reserved.
//

import UIKit

class BookmarkTableViewCell: UITableViewCell {

    //MARK: Properties
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookTitleLabel: UILabel!
    @IBOutlet weak var bookSectionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

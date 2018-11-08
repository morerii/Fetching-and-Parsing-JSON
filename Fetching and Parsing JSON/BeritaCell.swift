//
//  BeritaCell.swift
//  Fetching and Parsing JSON
//
//  Created by MoreriDaffa on 06/11/18.
//  Copyright © 2018 MoreriProject. All rights reserved.
//

import UIKit

class BeritaCell: UITableViewCell {

    @IBOutlet weak var lbAuthor: UILabel!
    @IBOutlet weak var lbDesc: UILabel!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var imgBerita: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        

        
    }

}

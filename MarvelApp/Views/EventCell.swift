//
//  EventCell.swift
//  MarvelApp
//
//  Created by Mariel Masuck on 28/09/2022.
//  Copyright © 2022 Mmasuck. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell {

    let customization = CharacterCell()
    
    

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        customization.layoutCorners()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

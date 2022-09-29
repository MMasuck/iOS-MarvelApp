//
//  CharacterCell.swift
//  MarvelApp
//
//  Created by Mariel Masuck on 28/09/2022.
//  Copyright © 2022 Mmasuck. All rights reserved.
//

import UIKit

class CharacterCell: UITableViewCell {

    
    
    @IBOutlet weak var characterDescriptionLabel: UILabel!
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
       layoutCorners()
        
    }
    
    func layoutCorners() {
        //cellFrame.layer.cornerRadius = 4
        cellImage.layer.cornerRadius = 4
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

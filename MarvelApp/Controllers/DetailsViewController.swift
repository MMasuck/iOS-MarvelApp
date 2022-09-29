//
//  DetailsViewController.swift
//  MarvelApp
//
//  Created by Mariel Masuck on 28/09/2022.
//  Copyright © 2022 Mmasuck. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    let charViewController = CharacterViewController()
    var charImage = UIImageView()
    
    var characterTitle: String?
    var apiImage: UIImageView?
    var characterDescription: String?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
      
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = characterTitle
        descriptionLabel.text = characterDescription           
    }
    
    func setUpImage() {
        let url = "\(charViewController.imageURL)"
        charImage.loadImage(with: url)
    }
}

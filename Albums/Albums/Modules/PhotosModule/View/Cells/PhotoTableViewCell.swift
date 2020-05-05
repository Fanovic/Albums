//
//  PhotoTableViewCell.swift
//  Albums
//
//  Created by Zibra Coders on 05/05/2020.
//  Copyright © 2020 Fanovic. All rights reserved.
//

import UIKit
import Kingfisher

class PhotoTableViewCell: UITableViewCell {

    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with photo: Photo) {
        idLabel.text = "\(photo.id)"
        titleLabel.text = "\(photo.title)"
        titleLabel.sizeToFit()

        if let primaryImage = URL(string: photo.url) {
            photoImage.kf.setImage(with: .network(primaryImage))
        } else if let placeholderImage = URL(string: photo.thumbnailUrl) {
            photoImage.kf.setImage(with: .network(placeholderImage))
        } else {
            photoImage.backgroundColor = .red
        }
        
    }
    
}

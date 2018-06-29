//
//  CollectionViewCellCarte.swift
//  niouApp
//
//  Created by Benoît Neuts on 29/06/2018.
//  Copyright © 2018 Benoît Neuts. All rights reserved.
//

import UIKit

class CollectionViewCellCarte: UICollectionViewCell {
    @IBOutlet weak var imageViewCarte: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func tourner(estDameDeCoeur : Bool) {
        UIView.transition(with: imageViewCarte, duration: 0.5, options: [.transitionFlipFromLeft], animations: {
            
            if (estDameDeCoeur) {
                self.imageViewCarte.image = #imageLiteral(resourceName: "coeur")
            } else {
                self.imageViewCarte.image = #imageLiteral(resourceName: "pique")
            }
        })
        
    }
    
}

//
//  Plateau.swift
//  niouApp
//
//  Created by Benoît Neuts on 29/06/2018.
//  Copyright © 2018 Benoît Neuts. All rights reserved.
//

import Foundation

struct Plateau {
    
    var Cartes = [Carte]()
    
    mutating func initPlateau(nbCartes: Int) {
        let positionDameCoeur = arc4random_uniform(UInt32(nbCartes))
        for i in 0..<nbCartes {
            if i == positionDameCoeur {
                Cartes.append(.DameCoeur)
            } else {
                Cartes.append(.DamePique)
            }

        }
    }
    
    func estDameDeCoeur(position: Int) -> Bool {
        return Cartes[position] == .DameCoeur
    }
}

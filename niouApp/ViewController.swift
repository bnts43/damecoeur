//
//  ViewController.swift
//  niouApp
//
//  Created by Benoît Neuts on 29/06/2018.
//  Copyright © 2018 Benoît Neuts. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionViewPlateau: UICollectionView!
    
    
    let nbCartes = 9
    var jeu = Plateau()
    let identifierCarte = "viewCellIdentifierCarte"

    override func viewDidLoad() {
        super.viewDidLoad()
        jeu.initPlateau(nbCartes: nbCartes)
        
        collectionViewPlateau.dataSource = self
        collectionViewPlateau.delegate = self
        
        collectionViewPlateau.register(UINib.init(nibName: "CollectionViewCellCarte", bundle: nil), forCellWithReuseIdentifier: identifierCarte)
        
        let tapGR = UITapGestureRecognizer.init(target: self, action: #selector(handlerTapGesture))
        
        collectionViewPlateau.addGestureRecognizer(tapGR)

        tapGR.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }



}

extension ViewController : UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return jeu.Cartes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: identifierCarte, for: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let largeur = collectionView.bounds.width / CGFloat(nbCartes).squareRoot().rounded(.up)
        let hauteur = collectionView.bounds.height / CGFloat(nbCartes).squareRoot().rounded(.down)
        
        return CGSize(width: largeur, height: hauteur)
    }
}

extension ViewController : UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    @objc func handlerTapGesture(_ tapGestureRecognizer : UITapGestureRecognizer) {
        let position = tapGestureRecognizer.location(in: collectionViewPlateau)
        let indexPath = collectionViewPlateau.indexPathForItem(at: position)!
        let cell = collectionViewPlateau.cellForItem(at: indexPath) as! CollectionViewCellCarte
        let estDameDeCoeur = jeu.estDameDeCoeur(position: indexPath.row)
        
        cell.tourner(estDameDeCoeur: estDameDeCoeur)
    }
    
    
}



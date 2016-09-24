//
//  ViewController.swift
//  CardsStackExample
//
//  Created by housing on 9/24/16.
//  Copyright © 2016 Pritesh. All rights reserved.
//

import UIKit
import CardsStack

class ViewController: UIViewController {

    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var cardState: CardsPosition = .Collapsed
    var configuration = Configuration(cardOffset: 40, collapsedHeight: 200, expandedHeight: 600, cardHeight: 200, downwardThreshold: 20, upwardThreshold: 20, leftSpacing: 8.0, rightSpacing: 8.0, verticalSpacing: 8.0)
    
    var cardsManager: CardsStack = CardsStack()
    var pokemons = [Pokemon(name: "Pikachu", imageName:"pika"), Pokemon(name: "Squirtle", imageName:"squirtle"), Pokemon(name: "Blastoise", imageName:"blastoise"), Pokemon(name: "Charmender", imageName:"charmender"), Pokemon(name: "Raichu", imageName:"raichu"), Pokemon(name: "Evy", imageName:"evy"),Pokemon(name: "Charizard", imageName:"charizard"),Pokemon(name: "gengar", imageName:"gengar"),Pokemon(name: "Alakazam", imageName:"alakazam")]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        cardsManager = CardsStack(cardsState: cardState, configuration: configuration, collectionView: collectionView, collectionViewHeight: heightConstraint)
        cardsManager.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UICollectionViewDataSource, CardsManagerDelegate {
    func tappedOnCardsStack(cardsCollectionView: UICollectionView) {
        cardsManager.updateView(with: .Expanded)
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cardView = collectionView.dequeueReusableCell(withReuseIdentifier: "CardReuseID", for: indexPath) as? CardView else {
            fatalError("Failed to downcast to CardView")
        }
        cardView.header.text = "\(pokemons[indexPath.item].name)"

            cardView.imageView.image = UIImage(imageLiteralResourceName: pokemons[indexPath.item].imageName)

        return cardView
    }

}


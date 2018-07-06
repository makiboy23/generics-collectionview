//
//  ViewController.swift
//  Generics
//
//  Created by Marknel Pineda on 06/07/2018.
//  Copyright © 2018 mvpineda. All rights reserved.
//

import UIKit


class MainViewController: BaseCollectionViewController<EpisodeCell, Episode>, UICollectionViewDelegateFlowLayout {
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    func fetchData() {
//        items = [
//            Dog(name: "Woof Woof"),
//            Dog(name: "Ruff Ruff Ruff")
//        ]
        
//        APIService.shared.fetchTracks { (episodes) in
//            episodes.forEach({print($0.title, $0.genre, $0.imageUrl)})
//            self.items = episodes
//        }
        
        APIService.shared.fetchGenericData { (episodes: [Episode])  in
            episodes.forEach({print($0.title, $0.genre, $0.imageUrl)})
            self.items = episodes
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 40)
    }
}





















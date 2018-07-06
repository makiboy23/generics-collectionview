//
//  BaseCollectionViewController.swift
//  Generics
//
//  Created by Marknel Pineda on 06/07/2018.
//  Copyright © 2018 mvpineda. All rights reserved.
//

import UIKit

class BaseCollectionViewController<T: BaseCell<U>, U>: UICollectionViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    let cellId = "cellId"
    
    var items = [U]() {
        didSet {
            collectionView?.reloadData()
        }
    }
    
    func setupViews() {
        collectionView?.backgroundColor = .white
        collectionView?.register(T.self, forCellWithReuseIdentifier: cellId)
        collectionView?.delegate = self
        collectionView?.dataSource = self
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! BaseCell<U>
        cell.item = items[indexPath.row]
        return cell
    }
}

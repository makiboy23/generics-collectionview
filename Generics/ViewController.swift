//
//  ViewController.swift
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

class BaseCell<U>: UICollectionViewCell {
    var item: U!
}

struct Dog {
    let name: String
}

class DogCell: BaseCell<Dog> {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    override var item: Dog! {
        didSet {
            textLabel.text = item.name
        }
    }
    
    let textLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func setupViews() {
        addSubview(textLabel)
        textLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        textLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        textLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -15).isActive = true
        
        addSubview(separatorView)
        separatorView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        separatorView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        separatorView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        separatorView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class MainViewController: BaseCollectionViewController<DogCell, Dog>, UICollectionViewDelegateFlowLayout {
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    func fetchData() {
        items = [
            Dog(name: "Woof Woof"),
            Dog(name: "Ruff Ruff Ruff")
        ]
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 40)
    }
}





















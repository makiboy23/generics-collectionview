//
//  DogCell.swift
//  Generics
//
//  Created by Marknel Pineda on 06/07/2018.
//  Copyright © 2018 mvpineda. All rights reserved.
//

import UIKit

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

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}











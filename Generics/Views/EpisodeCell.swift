//
//  EpisodeCell.swift
//  Generics
//
//  Created by Marknel Pineda on 06/07/2018.
//  Copyright © 2018 mvpineda. All rights reserved.
//

import UIKit

class EpisodeCell: BaseCell<Episode> {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override var item: Episode! {
        didSet {
            textLabel.text = item.title ?? ""
            thumbnailImageView.loadImage(urlString: item.imageUrl ?? "")
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



















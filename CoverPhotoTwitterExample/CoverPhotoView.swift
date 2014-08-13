//
//  CoverPhotoView.swift
//  CoverPhotoTwitterExample
//
//  Created by Ivan Vavilov on 13/08/14.
//  Copyright (c) 2014 Ivan Vavilov. All rights reserved.
//

import UIKit

class CoverPhotoView: UIImageView {
//  You should redefine this method for touches interaction with cover photo like scrollview
    override func pointInside(point: CGPoint, withEvent event: UIEvent!) -> Bool {
        return false
    }
    
}

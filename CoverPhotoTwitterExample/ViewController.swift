//
//  ViewController.swift
//  CoverPhotoTwitterExample
//
//  Created by Ivan Vavilov on 13/08/14.
//  Copyright (c) 2014 Ivan Vavilov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    //    MARK: Constants
    let kInitialCoverPhotoVerticalSpace:CGFloat = 0
    let kInitialCoverPhotoImageViewHeight:CGFloat = 160
    
    let kCirclePhotoBorderWidth:CGFloat = 1
    let kInitialCoverPhotoBlurRadius:CGFloat = 2
    let kWhiteComponentBlurTintColor:CGFloat = 0.4
    let kAlphaComponentBlurTintColor:CGFloat = 0.15
    let kCoverPhotoSaturationDeltaFactor:CGFloat = 1
    let kBlurFactor:CGFloat = 0.05
    
//    MARK Outlets
    @IBOutlet var scrollView : UIScrollView
    @IBOutlet var coverPhotoImageView : UIImageView
    @IBOutlet var circlePhotoImageView : UIImageView
    
    @IBOutlet var coverPhotoImageViewTopSpaceConstraint : NSLayoutConstraint
    @IBOutlet var scrollViewContentTopSpaceConstraint : NSLayoutConstraint
    @IBOutlet var coverPhotoImageViewHeight : NSLayoutConstraint
    @IBOutlet var circlePhotoHeight : NSLayoutConstraint
    
//    MARK Instance Variables
    var originalCoverImage:UIImage?
    
//    MARK View Lyfecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        scrollView.delegate = self
        setupCoverPhoto()
        setupCirclePhoto()
    }
    
    func setupCoverPhoto() {
        originalCoverImage = UIImage(named: "norris.jpg")
        coverPhotoImageView.image = originalCoverImage
        blurCoverPhoto(kInitialCoverPhotoBlurRadius)
    }
    
    func setupCirclePhoto() {
        circlePhotoImageView.image = UIImage(named: "chuck.jpg")
        circlePhotoImageView.layer.cornerRadius = circlePhotoHeight.constant/2
        circlePhotoImageView.layer.masksToBounds = true
        circlePhotoImageView.layer.borderWidth = kCirclePhotoBorderWidth
        circlePhotoImageView.layer.borderColor = UIColor.whiteColor().CGColor
    }
    
    func blurCoverPhoto(radius:CGFloat) {
        let blurTintColor:UIColor! = UIColor(white:kWhiteComponentBlurTintColor, alpha:kAlphaComponentBlurTintColor)
        
        coverPhotoImageView.image = self.originalCoverImage?.applyBlurWithRadius(radius, tintColor: blurTintColor, saturationDeltaFactor: kCoverPhotoSaturationDeltaFactor, maskImage: nil)
    }
    
//    MARK Scroll View Delegate
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        let delta = scrollView.contentOffset.y
        
        if delta >= 0  {
            coverPhotoImageViewTopSpaceConstraint.constant = kInitialCoverPhotoVerticalSpace - delta
            blurCoverPhoto(kInitialCoverPhotoBlurRadius)
        }
        else {
            coverPhotoImageViewHeight.constant = kInitialCoverPhotoImageViewHeight - delta
            blurCoverPhoto(kInitialCoverPhotoBlurRadius - delta*kBlurFactor)
        }
    }
}


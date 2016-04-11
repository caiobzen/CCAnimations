//
//  ViewController.swift
//  CCAnimations
//
//  Created by Carlos Corrêa on 4/11/16.
//  Copyright © 2016 Carlos Corrêa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var animationsSegment: UISegmentedControl!
    
    @IBOutlet weak var animateButton: UIButton!
    @IBOutlet weak var animationTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        imgView.layer.cornerRadius = CGRectGetWidth(imgView.frame) / 2
        animateButton.layer.cornerRadius = 3.0
        animationTitle.text = "CCAnimationPop()"
    }

    @IBAction func animateButtonTouched(sender: AnyObject) {
        switch animationsSegment.selectedSegmentIndex {
        case 0:
            imgView.CCAnimationPop()
        case 1:
            imgView.CCAnimationShake()
        case 2:
            imgView.CCAnimationRotate()
        case 3:
            imgView.CCAnimation3DxRotation()
        case 4:
            imgView.CCAnimation3DyRotation()
        case 5:
            imgView.CCAnimationJump(intensity: 50)
        case 6:
            imgView.CCAnimationFadeUp(3.0, intensity: 200)
        case 7:
            imgView.CCAnimationFadeDown(3.0, intensity: 200)
        case 8:
            imgView.CCAnimationFadeToLeft(3.0, intensity: 200)
        case 9:
            imgView.CCAnimationFadeToRight(3.0, intensity: 200)
        case 10:
            imgView.CCAnimationJumpTwistY(intensity: 100)
        case 11:
            imgView.CCAnimationJumpTwistX(intensity: 100)
        default:
            break
        }
    }

    @IBAction func segmentDidChanged(sender: AnyObject) {
        switch animationsSegment.selectedSegmentIndex {
        case 0:
            animationTitle.text = "CCAnimationPop()"
        case 1:
            animationTitle.text = "CCAnimationShake()"
        case 2:
            animationTitle.text = "CCAnimationRotate()"
        case 3:
            animationTitle.text = "CCAnimation3DxRotation()"
        case 4:
            animationTitle.text = "CCAnimation3DyRotation()"
        case 5:
            animationTitle.text = "CCAnimationJump()"
        case 6:
            animationTitle.text = "CCAnimationFadeUp()"
        case 7:
            animationTitle.text = "CCAnimationFadeDown()"
        case 8:
            animationTitle.text = "CCAnimationFadeToLeft()"
        case 9:
            animationTitle.text = "CCAnimationFadeToRight()"
        case 10:
            animationTitle.text = "CCAnimationJumpTwistY()"
        case 11:
            animationTitle.text = "CCAnimationJumpTwistX()"
        default:
            break
        }
    }
}


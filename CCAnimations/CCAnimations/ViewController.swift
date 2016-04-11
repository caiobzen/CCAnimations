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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgView.layer.cornerRadius = CGRectGetWidth(imgView.frame) / 2
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
            imgView.CCAnimationJump(intensity: 100)
        case 6:
            imgView.CCAnimationFadeUp(intensity: 100)
        case 7:
            imgView.CCAnimationFadeDown(intensity: 100)
        case 8:
            imgView.CCAnimationFadeToLeft(intensity: 100)
        case 9:
            imgView.CCAnimationFadeToRight(intensity: 100)
        case 10:
            imgView.CCAnimationJumpTwistY(intensity: 100)
        case 11:
            imgView.CCAnimationJumpTwistX(intensity: 100)
        default:
            break
        }
    }

}


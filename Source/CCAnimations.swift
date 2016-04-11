//
//  CCAnimations.swift
//  PopAnimation
//
//  Created by Carlos Corrêa on 10/04/16.
//  Copyright © 2016 Carlos Corrêa. All rights reserved.
//



import UIKit

enum AnimationKeyPath:String {
    case
    scale        = "transform.scale",
    zRotation    = "transform.rotation.z",
    xPosition    = "position.x",
    yPosition    = "position.y",
    xTranslation = "translation.x",
    transform    = "transform",
    opacity      = "opacity"
}

enum Axis {
    case
    x,
    y,
    z
}

enum Side {
    case
    Up,
    Down,
    Left,
    Right
}

// MARK: helpers

func degreeToRadians(angle:Float) -> Float {
    return (angle / 180 * Float(M_PI))
}

extension UIView {
    
    // MARK: - Setup Animation functions
    
    private func setupBasicAnimation(animation:CABasicAnimation,
                                     duration:CFTimeInterval,
                                     fromValue:AnyObject? = nil,
                                     toValue:AnyObject? = nil,
                                     byValue:AnyObject? = nil,
                                     cumulative: Bool = false,
                                     reverse: Bool = false,
                                     repeatCount:Float = 0,
                                     fillMode:String = kCAFilterLinear,
                                     removedOnCompletion:Bool = true) {
        
        animation.duration = duration
        animation.cumulative = cumulative
        animation.repeatCount = repeatCount
        animation.fromValue = fromValue
        animation.toValue = toValue
        animation.byValue = byValue
        animation.autoreverses = reverse
        animation.fillMode = fillMode
        animation.removedOnCompletion = removedOnCompletion
    }
    
    private func setupKeyFrameAnimation(animation:CAKeyframeAnimation,
                                        values:[AnyObject]?,
                                        keyTimes:[AnyObject]?,
                                        duration:CFTimeInterval) {
        animation.values = values
        animation.keyTimes = keyTimes as? [NSNumber] ?? []
        animation.duration = duration
    }
    
    private func setupSpringAnimation(animation:CASpringAnimation,
                                      damping:CGFloat = 1.0,
                                      initialVelocity:CGFloat = 1.0,
                                      speed:Float = 1.0) {
        animation.damping = damping
        animation.initialVelocity = initialVelocity
        animation.speed = speed
    }
    
    private func runAnimation(animation:CAAnimation) {
        self.layer.addAnimation(animation, forKey: nil)
    }
    
    // MARK: - Factory
    
    private func newAnimation<T:CAAnimation>(type:T.Type, keyPath:AnimationKeyPath) -> T {
        if type == CABasicAnimation.self {
            return basicAnimation(keyPath: keyPath) as! T
        } else if type == CAKeyframeAnimation.self {
            return keyFrameAnimation(keyPath: keyPath) as! T
        } else if type == CASpringAnimation.self {
            return springAnimation(keyPath: keyPath) as! T
        }
        return CAAnimation() as! T
    }

    private func basicAnimation(keyPath keyPath: AnimationKeyPath) -> CABasicAnimation {
        return CABasicAnimation(keyPath: keyPath.rawValue)
    }
    
    private func keyFrameAnimation(keyPath keyPath: AnimationKeyPath) -> CAKeyframeAnimation {
        return CAKeyframeAnimation(keyPath: keyPath.rawValue)
    }
    
    private func springAnimation(keyPath keyPath: AnimationKeyPath) -> CASpringAnimation {
        return CASpringAnimation(keyPath: keyPath.rawValue)
    }
    
    // MARK: - Animation Helpers
    
    private func scaleAnimation(size:CGFloat, duration:CFTimeInterval) {
        let animation = newAnimation(CASpringAnimation.self, keyPath: .scale)
        setupBasicAnimation(animation, duration: duration, toValue:size, reverse:true)
        setupSpringAnimation(animation, damping: 7.0, initialVelocity: 1.1, speed: 1.7)
        runAnimation(animation)
    }
    
    private func shakeAnimation(duration:CFTimeInterval) {
        let centerPoint = self.center
        let animationValues = [centerPoint.x, centerPoint.x + 5, centerPoint.x - 5, centerPoint.x + 5, centerPoint.x]
        let keyTimes = [0, 0.25, 0.75, 1.25, 1]
        let animation = newAnimation(CAKeyframeAnimation.self, keyPath: .xPosition)
        setupKeyFrameAnimation(animation, values: animationValues, keyTimes: keyTimes, duration: duration)
        runAnimation(animation)
    }
    
    private func rotate360(repeatCount repeatCount:Float, duration:CFTimeInterval) {
        let animation = newAnimation(CABasicAnimation.self, keyPath: .zRotation)
        let repeatCount = repeatCount == 0 ? Float(CGFloat.max) : repeatCount
        setupBasicAnimation(animation, duration:duration, toValue:(M_PI * 2.0), repeatCount:repeatCount)
        runAnimation(animation)
    }
    
    private func jumpWithIntensity(withIntensity intensity:CGFloat, duration:CFTimeInterval) {
        let currentPoint = self.center
        let fromValue = currentPoint.y
        let toValue = fromValue - intensity
        let animation = newAnimation(CASpringAnimation.self, keyPath: .yPosition)
        setupBasicAnimation(animation, duration: duration, toValue:toValue, reverse:true)
        setupSpringAnimation(animation, damping: 8.2, initialVelocity: 1.2, speed: 1.1)
        runAnimation(animation)
    }
    
    private func rotate3DWithAxis(axis:Axis, withDuration duration:CFTimeInterval) {
        var transform3D:CATransform3D
        
        if axis == .x {
            transform3D = CATransform3DRotate(self.layer.transform, CGFloat(degreeToRadians(180)), 0.0, 1.0, 0.0)
        } else {
            transform3D = CATransform3DRotate(self.layer.transform, CGFloat(degreeToRadians(180)), 1.0, 0.0, 0.0)
        }
    
        let animation = newAnimation(CABasicAnimation.self, keyPath: .transform)
        setupBasicAnimation(animation, duration: duration, toValue: NSValue(CATransform3D:transform3D), fillMode:kCAFillModeForwards, removedOnCompletion:false, repeatCount:2, cumulative:true)
        runAnimation(animation)
    }
    
    private func moveSideways(WithDuration duration:CFTimeInterval, side:Side, value:CGFloat) {
        let keyPath:AnimationKeyPath
        var toValue:CGFloat = 0.0
        switch side {
        case .Up,
             .Down:
            keyPath = .yPosition
            toValue = self.center.y
            break
        case .Left,
             .Right:
            keyPath = .xPosition
            toValue = self.center.x
            break
        }
        
        if (side == .Left || side == .Up) {
            toValue -= value
        } else {
            toValue += value
        }
        
        let animation = newAnimation(CABasicAnimation.self, keyPath: keyPath)
        setupBasicAnimation(animation, duration: duration, toValue:toValue)
        runAnimation(animation)
    }
    
    private func alphaAnimation(withDuration duration:CFTimeInterval, withAlpha alpha:CGFloat) {
        let animation = newAnimation(CABasicAnimation.self, keyPath: .opacity)
        setupBasicAnimation(animation, duration: duration, toValue:alpha)
        runAnimation(animation)
    }
    
    
    // MARK: - Custom animations
    
    /**
     This will create a pop animation by growing or shrinking the view scale size and then going back to the original state
     
     - parameter duration:    The duration of the animation
     - parameter scale: The scale size that the view will resize to (1.0 is the original scale)
     */
    func CCAnimationPop(duration:CFTimeInterval = 0.3, scale:CGFloat = 1.05) {
        scaleAnimation(scale, duration: duration)
    }
    
    /**
     This will create a shake animation by moving the view x position to the left and right
     
     - parameter duration:    The duration of the animation
     */
    func CCAnimationShake(duration:CFTimeInterval = 0.4) {
        shakeAnimation(duration)
    }
    
    /**
     This will create a 360 degrees rotation animation
     
     - parameter duration:    The duration of the animation
     - parameter repeatCount: The number of times that the animation will repeat. 0 stands for infinite.
     */
    func CCAnimationRotate(duration:CFTimeInterval = 0.4, repeatCount:Float = 1) {
        rotate360(repeatCount: repeatCount, duration: duration)
    }
    
    /**
     This will create a jump-like animation, by changing the Y position.
     
     - parameter duration: The animation duration
     - parameter intensity: how much the view will be moved in the Y axis.
     */
    func CCAnimationJump(duration:CFTimeInterval = 0.3, intensity:CGFloat) {
        jumpWithIntensity(withIntensity: intensity, duration: duration)
    }
    
    /**
     This will create a X axis rotation animation by 360 degrees.
     
     - parameter duration: The animation duration
     */
    func CCAnimation3DxRotation(duration:CFTimeInterval = 0.4) {
        rotate3DWithAxis(.x, withDuration: duration)
    }
    
    /**
     This will create a Y axis rotation animation by 360 degrees.
     
     - parameter duration: The animation duration
     */
    func CCAnimation3DyRotation(duration:CFTimeInterval = 0.4) {
        rotate3DWithAxis(.y, withDuration: duration)
    }
    
    /**
     This will create a jump and spin on X axis animation. It's a union of CCAnimationJump and CCJumpTwistXAnimation
     
     - parameter duration: The animation duration
     - parameter intensity: how much the view will be moved in the Y axis.
     */
    func CCAnimationJumpTwistX(duration:CFTimeInterval = 0.4, intensity:CGFloat) {
        CCAnimationJump(duration, intensity: intensity)
        CCAnimation3DxRotation(duration)
    }
    
    /**
     This will create a jump and spin on Y axis animation. It's a union of CCAnimationJump and CCJumpTwistYAnimation
     
     - parameter duration: The animation duration
     - parameter intensity: how much the view will be moved in the Y axis.
     */
    func CCAnimationJumpTwistY(duration:CFTimeInterval = 0.4, intensity:CGFloat) {
        CCAnimationJump(duration, intensity: intensity)
        CCAnimation3DyRotation(duration)
    }
    
    /**
     This will create a fade animation while moving the view to the left.
     
     - parameter duration:  The animation duration
     - parameter intensity: how much the view will be moved to the left.
     */
    func CCAnimationFadeToLeft(duration:CFTimeInterval = 0.4, intensity:CGFloat) {
        moveSideways(WithDuration: duration, side: .Left, value: intensity)
        alphaAnimation(withDuration: duration, withAlpha: 0)
    }
    
    /**
     This will create a fade animation while moving the view to the right.
     
     - parameter duration:  The animation duration
     - parameter intensity: how much the view will be moved to the tight.
     */
    func CCAnimationFadeToRight(duration:CFTimeInterval = 0.4, intensity:CGFloat) {
        moveSideways(WithDuration: duration, side: .Right, value: intensity)
        alphaAnimation(withDuration: duration, withAlpha: 0)
    }
    
    /**
     This will create a fade animation while moving the view to the top of the screen.
     
     - parameter duration:  The animation duration
     - parameter intensity: how much the view will be moved to the top of the screen.
     */
    func CCAnimationFadeUp(duration:CFTimeInterval = 0.4, intensity:CGFloat) {
        moveSideways(WithDuration: duration, side: .Up, value: intensity)
        alphaAnimation(withDuration: duration, withAlpha: 0)
    }
    
    /**
     This will create a fade animation while moving the view to the bottom of the screen.
     
     - parameter duration:  The animation duration
     - parameter intensity: how much the view will be moved to the bottom of the screen.
     */
    func CCAnimationFadeDown(duration:CFTimeInterval = 0.4, intensity:CGFloat) {
        moveSideways(WithDuration: duration, side: .Down, value: intensity)
        alphaAnimation(withDuration: duration, withAlpha: 0)
    }
}

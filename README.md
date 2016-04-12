# CCAnimations

[![Version](https://img.shields.io/cocoapods/v/CCAnimations.svg?style=flat)](http://cocoapods.org/pods/CCAnimations)
[![License](https://img.shields.io/cocoapods/l/CCAnimations.svg?style=flat)](http://cocoapods.org/pods/CCAnimations)
[![Platform](https://img.shields.io/cocoapods/p/CCAnimations.svg?style=flat)](http://cocoapods.org/pods/CCAnimations)

CCAnimations is a simple set of custom CAAnimations, handcrafted by me. I love to add animations in my apps, and everytime that I want to do that, I had to search through my apps for sample animation codes. Not anymore! Now I will focus on adding new animations as needed. 
Feel free to contribute with your own animations and feedbacks! :+1:

<br>
## Installation 💻

####CocoaPods
You can Install CCAnimations through [CocoaPods](https://cocoapods.org/pods/CCAnimations). In order to do this, add the following line to your Podfile:

`pod "CCAnimations"`

<br>

####Manually
Simply clone the repository (or even [download](https://github.com/caiobzen/CCAnimations/archive/master.zip) it) and add the file named `CCAnimations.swift` into your XCode project.

<br><br>
## Usage

In order to use any of those animations, you just need to pick an UIView object and call a CCAnimation as the following example:
```swift
myImgView.CCAnimationPop()
myLabel.CCAnimationRotate()
```
You can also specify some parameters, in order to create even more customizable animations:
```swift
myImgView.CCAnimationJump(intensity: 50)
myImgView.CCAnimationPop(0.9) // This will shrink the view, instead of making it bigger.
```

You can also mix animations, like the `CCAnimationJumpTwistX` that does both jump and 3DxRotation

For now, there are 12 custom animations:

##### ▶️ CCAnimationPop() 

<img src="https://github.com/caiobzen/CCAnimations/blob/master/CCAnimations/demo/1.gif?raw=true" alt="Demo" width="280" style="max-width:100%;">

<hr>
##### ▶️ CCAnimationShake() 

<img src="https://github.com/caiobzen/CCAnimations/blob/master/CCAnimations/demo/2.gif?raw=true" alt="Demo" width="280" style="max-width:100%;">

<hr>
##### ▶️ CCAnimationRotate() 

<img src="https://github.com/caiobzen/CCAnimations/blob/master/CCAnimations/demo/3.gif?raw=true" alt="Demo" width="280" style="max-width:100%;">

<hr>
##### ▶️ CCAnimation3DxRotation() 

<img src="https://github.com/caiobzen/CCAnimations/blob/master/CCAnimations/demo/4.gif?raw=true" alt="Demo" width="280" style="max-width:100%;">

<hr>
##### ▶️ CCAnimation3DyRotation() 

<img src="https://github.com/caiobzen/CCAnimations/blob/master/CCAnimations/demo/5.gif?raw=true" alt="Demo" width="280" style="max-width:100%;">

<hr>
##### ▶️ CCAnimationJump() 

<img src="https://github.com/caiobzen/CCAnimations/blob/master/CCAnimations/demo/6.gif?raw=true" alt="Demo" width="280" style="max-width:100%;">

<hr>
##### ▶️ CCAnimationFadeUp() 

<img src="https://github.com/caiobzen/CCAnimations/blob/master/CCAnimations/demo/7.gif?raw=true" alt="Demo" width="280" style="max-width:100%;">

<hr>
##### ▶️ CCAnimationFadeDown() 

<img src="https://github.com/caiobzen/CCAnimations/blob/master/CCAnimations/demo/8.gif?raw=true" alt="Demo" width="280" style="max-width:100%;">

<hr>
##### ▶️ CCAnimationFadeToLeft() 

<img src="https://github.com/caiobzen/CCAnimations/blob/master/CCAnimations/demo/9.gif?raw=true" alt="Demo" width="280" style="max-width:100%;">

<hr>
##### ▶️ CCAnimationFadeToRight() 

<img src="https://github.com/caiobzen/CCAnimations/blob/master/CCAnimations/demo/10.gif?raw=true" alt="Demo" width="280" style="max-width:100%;">

<hr>
##### ▶️ CCAnimationJumpTwistY() 

<img src="https://github.com/caiobzen/CCAnimations/blob/master/CCAnimations/demo/11.gif?raw=true" alt="Demo" width="280" style="max-width:100%;">

<hr>
##### ▶️ CCAnimationJumpTwistX() 

<img src="https://github.com/caiobzen/CCAnimations/blob/master/CCAnimations/demo/12.gif?raw=true" alt="Demo" width="280" style="max-width:100%;">



## 📜 License

CCAnimations is available under the MIT license. Please read the LICENSE file for more info if needed.

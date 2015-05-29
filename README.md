# BTBalloon

[![CI Status](http://img.shields.io/travis/brightec/BTBalloon.svg?style=flat)](https://travis-ci.org/brightec/BTBalloon)
[![Version](https://img.shields.io/cocoapods/v/BTBalloon.svg?style=flat)](http://cocoapods.org/pods/BTBalloon)
[![License](https://img.shields.io/cocoapods/l/BTBalloon.svg?style=flat)](http://cocoapods.org/pods/BTBalloon)
[![Platform](https://img.shields.io/cocoapods/p/BTBalloon.svg?style=flat)](http://cocoapods.org/pods/BTBalloon)

BTBalloon is a custom UIView subclass that will display text and optionally an image and/or button in a balloon style popup. You could use this view as tool tips to highlight various parts of your apps UI, or create an interactive tutorial (see example project). Think of BTBalloon views as being a cross-between UIAlertView and UIPopover. 

![]
(https://raw.githubusercontent.com/brightec/BTBalloon/master/image.png)

## Usage
BTBalloons can be displayed easily by calling one of the `-showWithTitle...` methods. For example, to show a balloon with an image, title and button, anchoring the balloon to an existing view you would issue the command:

``` objective-c
[[BTBalloon sharedInstance] showWithTitle:@"Hello World" image:[UIImage imageNamed:@"Icon"] anchorToView:self.myExistingView];
```

There is no need to instantiate the BTBalloon directly, instead just use the `sharedInstance`. You don't need to add the BTBalloon view directly to your view hierarchy as this will be handled for you automatically when calling one of the 	`-showWith` methods. We will automatically add the view over all other views.

It's worth noting that when using the `sharedInstance` only one BTBalloon view can appear on the screen at a time. If you want to show multiple balloon views you can create multiple instances of the class as shown below.

### Advanced usage

To show more than one balloon view at a time or customise the size of the balloon views you can just call the dedicated class initialiser to create your own instances of BTBalloon:

``` objective-c
BTBalloon *balloon = [BTBalloon new];
[balloon showWithTitle:@"Hello World" image:[UIImage imageNamed:@"Icon"] anchorToView:self.myExistingView];
```

or 

``` objective-c
BTBalloon *balloon = [BTBalloon alloc] initWithFrame:CGRectMake(0, 0, 300, 200);
[balloon showWithTitle:@"Hello World" image:[UIImage imageNamed:@"Icon"] anchorToView:self.myExistingView];
```

## Customising appearance

BTBalloon adhears to the UIAppearance protocol, for more information about UIAppearance see: https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIAppearance_Protocol/index.html

To customise the appearance just set the relevant style related properties of BTBalloon class's `appearance` proxy. The best place to add these lines is in your AppDelegate's `application:didFinishLaunchingWithOptions:` method.

``` objective-c
[BTBalloon appearance].buttonFont = [UIFont fontWithName:@"HelveticaNeue-Medium" size:18.0f];
[BTBalloon appearance].buttonTextColor = [UIColor colorWithWhite:0.279 alpha:1.000];
[BTBalloon appearance].buttonBackgroundColor = [UIColor colorWithWhite:0.922 alpha:1.000];
[BTBalloon appearance].balloonBackgroundColor = [UIColor colorWithRed:0.000 green:0.502 blue:1.000 alpha:0.950];
[BTBalloon appearance].textFont = [UIFont fontWithName:@"HelveticaNeue-Light" size:19.0f];
[BTBalloon appearance].textColor = [UIColor whiteColor];

```


## API

Show the balloon with a title and an image entered on the screen.

``` objective-c
- (void)showWithTitle:(NSString *)title image:(UIImage *)image;
```

Show the balloon with a title and an image positioned relative to an anchor view.

``` objective-c
- (void)showWithTitle:(NSString *)title image:(UIImage *)image anchorToView:(UIView *)view;
```

Show the balloon with a title, image and a button positioned relative to an anchor view. Provide a callback block to be executed on button press.
``` objective-c
- (void)showWithTitle:(NSString *)title image:(UIImage *)image anchorToView:(UIView *)view buttonTitle:(NSString *)buttonTitle buttonCallback:(void (^)(void))callbackBlock;
```

Show the balloon after a delay with a title, image and a button positioned relative to an anchor view. Provide a callback block to be executed on button press.

``` objective-c
- (void)showWithTitle:(NSString *)title image:(UIImage *)image anchorToView:(UIView *)view buttonTitle:(NSString *)buttonTitle buttonCallback:(void (^)(void))callbackBlock afterDelay:(NSTimeInterval)delay;
```

Update the current balloon's title, image, button and callback.

``` objective-c
- (void)updateTitle:(NSString *)title image:(UIImage *)image button:(NSString *)buttonTitle buttonCallback:(void (^)(void))callbackBlock;
```

Move an existing balloon to a new location relative to an anchor view.

``` objective-c
- (void)anchorToView:(UIView *)view;
```

Hide the balloon with animation. The balloon is not removed from the superview but instead hidden by adjusting the alpha and hidden properties. Never call `removeFromSuperview` as this will causes and future attempts to display the balloon to fail.

``` objective-c
- (void)hide;
```

Same as `-hide` but with the option of toggling the animation.

``` objective-c
- (void)hideWithAnimation:(BOOL)animated;
```

Show the balloon with animation. The view will added automatically to your app's view hierarchy so never call `addSubview:` on a superview passing in an instance of BTBalloon as you'll get undesired behaviour.

``` objective-c
- (void)show;
```

Same as a `-show` but with the option od toggling the animation.

``` objective-c
- (void)showWithAnimation:(BOOL)animated;
```

## Example project

An Example project is included which shows how to use BTBalloon to create an interactive walk-through with use of balloons to help guide the user through the process of performing a series of actions in the app.

## Installation

The recommended approach for installing BTBalloon is via the CocoaPods package manager, as it provides flexible dependency management and very simple installation. Alternatively you can just clone the Git repository and add the source files to your project.

### via CocoaPods

Install CocoaPods if not already available:

``` bash
$ [sudo] gem install cocoapods
$ pod setup
```

Change to the directory of your Xcode project, and Create and Edit your Podfile and add BTBalloon:

``` bash
$ cd /path/to/MyProject
$ touch Podfile
$ edit Podfile
platform :ios, '8.0'
pod 'BTBalloon'
```

Install into your project:

``` bash
$ pod install
```

Open your project in Xcode from the .xcworkspace file (not the usual project file)

``` bash
$ open MyProject.xcworkspace
```


## License

BTBalloon is licensed under the terms of the Apache License, version 2.0. Please see the LICENSE file for full details.

## Credits
BTBalloon is brought to you by https://github.com/brightec
//
//  BTAppTutorial.m
//  BalloonExample
//
//  Created by Cameron Cooke on 06/02/2015.
//  Copyright (c) 2015 Brightec Ltd. All rights reserved.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//


#import "BTAppTutorial.h"
#import "BTOverlay.h"
#import <BTBalloon/BTBalloon.h>
#import <PureLayout/PureLayout.h>
#import <UIKit/UIKit.h>


@interface BTAppTutorial ()
@property (strong, nonatomic) BTOverlay *overlayView;
@property (strong, nonatomic) UIButton *exitButton;

@property (assign, nonatomic, getter=isRunning) BOOL running;
@property (assign, nonatomic, readwrite) NSInteger currentStep;
@property (strong, nonatomic) void (^callbackBlock)(NSInteger currentStep);
@end


@implementation BTAppTutorial


+ (instancetype)sharedInstance
{
    static id sharedInstance = nil;
    @synchronized([self class])
    {
        if (sharedInstance == nil) {
            sharedInstance = [[self alloc] init];
        }
        return sharedInstance;
    }
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        _running = NO;
        _currentStep = 0;
    }
    return self;
}


- (void)startTutorialWithCallback:(void (^)(NSInteger currentStep))callbackBlock
{
    if (self.isRunning) {
        return;
    }

    self.running = YES;

    [self showOverlay];

    // perform next step action
    if ([self performStep:self.currentStep withAnchorView:nil completionCallback:callbackBlock]) {
        self.callbackBlock = callbackBlock;
    }
}


- (void)showNextStepWithAnchorView:(UIView *)view targetView:(UIView *)targetView completionCallback:(void (^)(NSInteger currentStep))callbackBlock
{
    // if no longer runner then ignore request
    if (!self.isRunning) {
        return;
    }

    [self showOverlay];
    
    // make sure overlay is always on top
    [self.overlayView.superview bringSubviewToFront:self.overlayView];

    // call the previous step's callback block if available
    if (self.callbackBlock != nil) {
        self.callbackBlock(self.currentStep);
    }
    self.callbackBlock = nil;

    // advance the step index
    self.currentStep++;

    // punch hole in overlay view
    self.overlayView.targetView = targetView;

    // perform next step action
    if ([self performStep:self.currentStep withAnchorView:view completionCallback:callbackBlock]) {
        self.callbackBlock = callbackBlock;
    }
}


- (void)endTutorial
{
    if (!self.isRunning) {
        return;
    }

    self.running = NO;
    self.currentStep = 0;
    self.callbackBlock = nil;

    [CATransaction begin];
    [CATransaction setCompletionBlock:^{

        [self.overlayView removeFromSuperview];
        self.overlayView = nil;
    }];
    [[BTBalloon sharedInstance] hideWithAnimation:YES];
    [self hideOverlay];
    [CATransaction commit];
}


#pragma mark -
#pragma mark Steps

/*!
 @abstract Shows the next balloon view
 @discussion Presents the balloon for the specified step and anchors it to the 
 anchor view.
 @param callbackBlock
 optionally pass in a block to attach to the balloon for handling action button touch events.
 @return BOOL
 Return NO if callback has already been handled i.e. by clicking the balloon action button or YES
 if you want the callback ot be called automatically before presenting the next step.
 */
- (BOOL)performStep:(NSInteger)step withAnchorView:(UIView *)view completionCallback:(void (^)(NSInteger currentStep))callbackBlock
{
    switch (step) {
        case 0: {
            [[BTBalloon sharedInstance] showWithTitle:@"BTBalloon can be used in a variety of different ways, this example will walk the user through a series of on screen actions"
                                                image:nil
                                         anchorToView:view
                                          buttonTitle:@"Continue"
                                       buttonCallback:^{
                                           if (callbackBlock != NULL) {
                                               callbackBlock(step);
                                           }
                                       }
                                           afterDelay:0.3f];
            return NO;
        }

        case 1: {
            [[BTBalloon sharedInstance] showWithTitle:@"Tap the Car Manufacturers button"
                                                image:[UIImage imageNamed:@"TapGesture"]
                                         anchorToView:view
                                          buttonTitle:nil
                                       buttonCallback:NULL
                                           afterDelay:0.3f];
            break;
        }
            
        case 2: {
            [[BTBalloon sharedInstance] showWithTitle:@"Here is a list of car manufacturers. Tap the button below to continue"
                                                image:nil
                                         anchorToView:view
                                          buttonTitle:@"Continue"
                                       buttonCallback:^{
                                           if (callbackBlock != NULL) {
                                               callbackBlock(step);
                                           }
                                       }
                                           afterDelay:0.3f];
            return NO;
        }
            
        case 3: {
            [[BTBalloon sharedInstance] showWithTitle:@"Tap the Alfa Romeo row"
                                                image:[UIImage imageNamed:@"TapGesture"]
                                         anchorToView:view
                                          buttonTitle:nil
                                       buttonCallback:NULL
                                           afterDelay:0.3f];
            break;
        }
            
        case 4: {
            [[BTBalloon sharedInstance] showWithTitle:@"This screen shows details about the Alfa Romeo. Tap the button below to continue"
                                                image:nil
                                         anchorToView:view
                                          buttonTitle:@"Continue"
                                       buttonCallback:^{
                                           if (callbackBlock != NULL) {
                                               callbackBlock(step);
                                           }
                                       }
                                           afterDelay:0.3f];
            return NO;
        }
            
        case 5: {
            [[BTBalloon sharedInstance] showWithTitle:@"When you're done reading, you can tap this back button (above) to continue the tutorial"
                                                image:[UIImage imageNamed:@"TapGesture"]
                                         anchorToView:view
                                          buttonTitle:@"Start Reading"
                                       buttonCallback:^{
                                           if (callbackBlock != NULL) {
                                               callbackBlock(step);
                                           }
                                       }
                                           afterDelay:0.3f];
            return NO;
        }
            
        case 6: {
            [[BTBalloon sharedInstance] showWithTitle:@"You've finished the tutorial"
                                                image:nil
                                         anchorToView:view
                                          buttonTitle:@"Dismiss"
                                       buttonCallback:^{
                                           if (callbackBlock != NULL) {
                                               callbackBlock(step);
                                           }
                                       }
                                           afterDelay:0.3f];
            return NO;
        }

        default:
            // no more steps so end tutorial
            [self endTutorial];
            break;
    }
    
    return YES;
}


#pragma mark -
#pragma mark UI

- (void)showOverlay
{
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    if (self.overlayView == nil) {
        self.overlayView = [[BTOverlay alloc] initWithFrame:window.bounds];
        self.overlayView.translatesAutoresizingMaskIntoConstraints = NO;
        self.overlayView.backgroundColor = [UIColor clearColor];
        self.overlayView.opaque = NO;
        [window addSubview:self.overlayView];
        [self.overlayView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];

        UIButton *exitButton = [UIButton buttonWithType:UIButtonTypeCustom];
        exitButton.tintAdjustmentMode = UIViewTintAdjustmentModeNormal;
        exitButton.translatesAutoresizingMaskIntoConstraints = NO;
        exitButton.tintColor = [UIColor redColor];
        UIImage *buttonImage = [UIImage imageNamed:@"CloseCross"];
        [exitButton setImage:buttonImage forState:UIControlStateNormal];
        [exitButton addTarget:self action:@selector(endTutorial) forControlEvents:UIControlEventTouchUpInside];
        [self.overlayView addSubview:exitButton];
        [exitButton autoSetDimensionsToSize:CGSizeMake(44.0f, 44.0f)];
        [exitButton autoPinEdgeToSuperviewEdge:ALEdgeTrailing];
        [exitButton autoPinEdgeToSuperviewEdge:ALEdgeBottom];
        self.exitButton = exitButton;
    }

    if (self.overlayView.superview == nil) {
        [window addSubview:self.overlayView];
    }

    [UIView animateWithDuration:0.3f animations:^{
        self.overlayView.alpha = 1.0f;
    }];
}


- (void)hideOverlay
{
    [UIView animateWithDuration:0.3f animations:^{
        self.overlayView.alpha = 0.0f;
    }];
}


- (void)hide
{
    [[BTBalloon sharedInstance] hideWithAnimation:YES];
    [self hideOverlay];
}


@end

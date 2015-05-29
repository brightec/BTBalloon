//
//  BTFirstViewController.m
//  BalloonExample
//
//  Created by Cameron Cooke on 05/02/2015.
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


#import "BTFirstViewController.h"
#import "BTAppTutorial.h"
#import <BTBalloon/BTBalloon.h>


@interface BTFirstViewController ()
@property (weak, nonatomic) IBOutlet UIButton *actionButton;
@end


@implementation BTFirstViewController


#pragma mark -
#pragma mark Actions

- (IBAction)showTutorialButtonWasTouched:(UIBarButtonItem *)sender
{
    [[BTAppTutorial sharedInstance] startTutorialWithCallback:^(NSInteger currentStep) {
        
        // move to next step
        [[BTAppTutorial sharedInstance] showNextStepWithAnchorView:self.actionButton targetView:self.actionButton completionCallback:NULL];
    }];
}


- (IBAction)unwindToThisViewController:(UIStoryboardSegue *)unwindSegue
{
    
}


@end

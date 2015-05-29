//
//  BTThirdViewController.m
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

#import "BTThirdViewController.h"
#import "BTAppTutorial.h"


@interface BTThirdViewController ()
@end


@implementation BTThirdViewController


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // make sure we're appearing in response to just being presented by previous tutorial step and not
    // another reason.
    if ([BTAppTutorial sharedInstance].currentStep == 3) {
        
        [[BTAppTutorial sharedInstance] showNextStepWithAnchorView:nil targetView:nil completionCallback:^(NSInteger currentStep) {
            
            // get the back buton view
            //
            // this is bit of a hack but shows how you can technically attach the
            // balloon view to any element in the view hierarchy.
            // I don't suggest you do this in production code.
            UIView *v;
            for (UIView *subview in self.navigationController.navigationBar.subviews) {
                if ([subview isKindOfClass:NSClassFromString(@"UINavigationItemButtonView")]) {
                    v = subview;
                    break;
                }
            }
            
            [[BTAppTutorial sharedInstance] showNextStepWithAnchorView:v targetView:nil completionCallback:^(NSInteger currentStep) {
                [[BTAppTutorial sharedInstance] hide];
            }];
        }];
    }
}


@end

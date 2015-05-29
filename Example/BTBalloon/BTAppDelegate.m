//
//  BTAppDelegate.m
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

#import "BTAppDelegate.h"
#import <BTBalloon/BTBalloon.h>


@interface BTAppDelegate ()
@end


@implementation BTAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Uncomment to override the styling for the balloons
//    [BTBalloon appearance].buttonFont = [UIFont fontWithName:@"HelveticaNeue-Medium" size:18.0f];
//    [BTBalloon appearance].buttonTextColor = [UIColor colorWithWhite:0.279 alpha:1.000];
//    [BTBalloon appearance].buttonBackgroundColor = [UIColor colorWithWhite:0.922 alpha:1.000];
//    [BTBalloon appearance].balloonBackgroundColor = [UIColor colorWithRed:0.000 green:0.502 blue:1.000 alpha:0.950];
//    [BTBalloon appearance].textFont = [UIFont fontWithName:@"HelveticaNeue-Light" size:19.0f];
//    [BTBalloon appearance].textColor = [UIColor whiteColor];
    
    return YES;
}



@end

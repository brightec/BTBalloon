//
//  BTOverlay.m
//
//  Created by Cameron Cooke on 12/03/2014.
//  Copyright (c) 2014 Brightec Ltd. All rights reserved.
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


#import "BTOverlay.h"


@implementation BTOverlay


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
    }
    return self;
}


- (void)setTargetView:(UIView *)targetView
{
    _targetView = targetView;
    self.targetRect = [self.targetView.superview convertRect:self.targetView.frame toView:self];
    [self setNeedsDisplay];
}


- (void)drawRect:(CGRect)rect
{
    [[UIColor colorWithWhite:1.0f alpha:0.6f] setFill];
    UIRectFill(rect);
    
    CGRect holeRectIntersection = CGRectIntersection(self.targetRect, rect);
    
    [[UIColor clearColor] setFill];
    UIRectFill(holeRectIntersection);
}


- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    if (CGRectIsEmpty(self.targetRect)) {
        return YES;
    }
    
    if (CGRectContainsPoint(self.targetRect, point)) {
        return NO;
    }
    
    return YES;
}


@end

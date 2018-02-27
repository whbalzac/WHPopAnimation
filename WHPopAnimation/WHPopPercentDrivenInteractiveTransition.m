//
//  WHPopPercentDrivenInteractiveTransition.m
//  swipeDismiss
//
//  Created by whbalzac on 27/02/2018.
//  Copyright © 2018 Zac. All rights reserved.
//

#import "WHPopPercentDrivenInteractiveTransition.h"
#import "WHPopHeader.h"

@implementation WHPopPercentDrivenInteractiveTransition

- (instancetype)initWithVc:(UIViewController *)vc
{
    self = [super init];
    if (self) {
        _vc = vc;
        UIScreenEdgePanGestureRecognizer *panGesture = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self
                                                                                      action:@selector(panGestureHander:)];
        panGesture.edges = UIRectEdgeLeft;
        [vc.view addGestureRecognizer:panGesture];
    }
    return self;
}

- (void)panGestureHander:(UIScreenEdgePanGestureRecognizer *)gesture
{
    CGFloat point_x = WHPopScreenWidth + [gesture locationInView:_vc.view].x;
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan: {
            _isInteracting = YES;
            [_vc dismissViewControllerAnimated:YES completion:nil];
            break;
        }
        case UIGestureRecognizerStateChanged: {
            CGFloat fraction = (point_x / WHPopScreenWidth);
            fraction = fmin(fmaxf(fraction, 0.0), 1.0);
            _shouldComplete = fraction > 0.5;
            [self updateInteractiveTransition:fraction];
            break;
        }
        case UIGestureRecognizerStateEnded: {
            _isInteracting = NO;
            if (!_shouldComplete || gesture.state == UIGestureRecognizerStateCancelled) {
                [self cancelInteractiveTransition];
            }else {
                [self finishInteractiveTransition];
            }
            break;
        }
        default:
            break;
    }
}

@end

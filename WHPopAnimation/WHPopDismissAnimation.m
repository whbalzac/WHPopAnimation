//
//  WHDismissAnimation.m
//  swipeDismiss
//
//  Created by whbalzac on 27/02/2018.
//  Copyright © 2018 Zac. All rights reserved.
//

#import "WHPopDismissAnimation.h"
#import "WHPopHeader.h"
@implementation WHPopDismissAnimation
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.4;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    CGRect initFrame = [transitionContext initialFrameForViewController:fromVC];
    CGRect finalFrame = CGRectOffset(initFrame, WHPopScreenWidth, 0);
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    [containerView sendSubviewToBack:toVC.view];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromVC.view.frame = finalFrame;
        toVC.view.alpha = 1.0;
        toVC.view.frame = CGRectOffset(toVC.view.frame, 110, 0);
    } completion:^(BOOL finished) {
        BOOL complate = [transitionContext transitionWasCancelled];
        [transitionContext completeTransition:(!complate)];
    }];
}

-(void)animationEnded:(BOOL)transitionCompleted {
}

@end

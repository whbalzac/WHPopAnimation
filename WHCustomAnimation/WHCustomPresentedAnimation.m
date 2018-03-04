//
//  WHPresentedAnimation.m
//  swipeDismiss
//
//  Created by whbalzac on 27/02/2018.
//  Copyright © 2018 Zac. All rights reserved.
//

#import "WHCustomPresentedAnimation.h"

@interface WHCustomPresentedAnimation ()
@property (nonatomic, assign) kWHCustomAnimationType type;
@end

@implementation WHCustomPresentedAnimation

- (instancetype)initWithType:(kWHCustomAnimationType)type
{
    self = [super init];
    if (self) {
        _type = type;
    }
    return self;
}

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.4;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    CGRect finalFrameForVC = [transitionContext finalFrameForViewController:toVC];
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
    if (self.type == kWHCustomAnimationTypePresent) {

    }else if (self.type == kWHCustomAnimationTypePush){
        toVC.view.frame = CGRectOffset(finalFrameForVC, WHCustomScreenWidth, 0);
        [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            fromVC.view.alpha = 0.5;
            toVC.view.frame = finalFrameForVC;
            fromVC.view.frame = CGRectOffset(fromVC.view.frame, -50, 0);
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    }else{
        toVC.view.frame = CGRectOffset(finalFrameForVC, 0, CGRectGetHeight(finalFrameForVC));
        [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            fromVC.view.alpha = 0.5;
            fromVC.view.layer.transform = CATransform3DMakeScale(0.9, 0.9, 0.9);
            toVC.view.frame = finalFrameForVC;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    }
    
}

-(void)animationEnded:(BOOL)transitionCompleted {
}

@end

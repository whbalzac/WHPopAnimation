//
//  WHDismissAnimation.m
//  swipeDismiss
//
//  Created by whbalzac on 27/02/2018.
//  Copyright © 2018 Zac. All rights reserved.
//

#import "WHCustomDismissAnimation.h"

@interface WHCustomDismissAnimation ()
@property (nonatomic, assign) kWHCustomAnimationType type;
@end

@implementation WHCustomDismissAnimation

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
    
    CGRect initFrame = [transitionContext initialFrameForViewController:fromVC];
    UIView *containerView = [transitionContext containerView];
    if (fromVC.modalPresentationStyle == UIModalPresentationFullScreen) {
        [containerView addSubview:toVC.view];
    }
    [containerView sendSubviewToBack:toVC.view];
    if (fromVC.modalPresentationStyle == UIModalPresentationCustom) {
        [toVC beginAppearanceTransition:YES animated:YES];
    }
    if (self.type == kWHCustomAnimationTypePresent) {

    }else if (self.type == kWHCustomAnimationTypePush){
        
        CGRect finalFrame = CGRectOffset(initFrame, WHCustomScreenWidth, 0);
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            fromVC.view.frame = finalFrame;
            toVC.view.alpha = 1.0;
            toVC.view.frame = CGRectOffset(toVC.view.frame, 50, 0);
        } completion:^(BOOL finished) {
            if (fromVC.modalPresentationStyle == UIModalPresentationCustom) {
                [toVC endAppearanceTransition];
            }
            BOOL complate = [transitionContext transitionWasCancelled];
            [transitionContext completeTransition:(!complate)];
        }];
    }else{
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            fromVC.view.frame = CGRectOffset(initFrame, 0, CGRectGetHeight(initFrame));
            toVC.view.alpha = 1.0;
            toVC.view.layer.transform = CATransform3DIdentity;
        } completion:^(BOOL finished) {
            if (fromVC.modalPresentationStyle == UIModalPresentationCustom) {
                [toVC endAppearanceTransition];
            }
            BOOL complate = [transitionContext transitionWasCancelled];
            [transitionContext completeTransition:(!complate)];
        }];
    }
}

-(void)animationEnded:(BOOL)transitionCompleted {
}

@end

//
//  WHPopViewController.m
//  swipeDismiss
//
//  Created by whbalzac on 27/02/2018.
//  Copyright © 2018 Zac. All rights reserved.
//

#import "WHPopViewController.h"
#import "WHPopHeader.h"
#import "WHPopDismissAnimation.h"
#import "WHPopPresentedAnimation.h"
#import "WHPopPercentDrivenInteractiveTransition.h"

@interface WHPopViewController ()
@property (nonatomic, strong) WHPopPercentDrivenInteractiveTransition *interactiveTransition;
@end

@implementation WHPopViewController

- (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion {
    
    viewControllerToPresent.transitioningDelegate = self;
    _interactiveTransition = [[WHPopPercentDrivenInteractiveTransition alloc] initWithVc:viewControllerToPresent];
    [super presentViewController:viewControllerToPresent animated:flag completion:completion];
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [[WHPopPresentedAnimation alloc]init];
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [[WHPopDismissAnimation alloc]init];
}

-(id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator {
    return (self.interactiveTransition.isInteracting ? self.interactiveTransition : nil);
}

- (void)dealloc{
    NSLog(@"%@ dealloced", NSStringFromClass([self class]));
}

@end

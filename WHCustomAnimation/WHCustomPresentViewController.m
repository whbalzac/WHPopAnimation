//
//  WHCustomViewController.m
//  swipeDismiss
//
//  Created by whbalzac on 27/02/2018.
//  Copyright © 2018 Zac. All rights reserved.
//

#import "WHCustomPresentViewController.h"
#import "WHCustomDismissAnimation.h"
#import "WHCustomPresentedAnimation.h"
#import "WHCustomPercentDrivenInteractiveTransition.h"

@interface WHCustomPresentViewController ()
@property (nonatomic, assign) kWHCustomAnimationType type;
@property (nonatomic, strong) WHCustomPercentDrivenInteractiveTransition *interactiveTransition;
@end

@implementation WHCustomPresentViewController

- (instancetype)initWithType:(kWHCustomAnimationType)type
{
    self = [super init];
    if (self) {
        _type = type;
    }
    return self;
}

- (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion {
    if (self.type != kWHCustomAnimationTypePresent){
        viewControllerToPresent.transitioningDelegate = self;
        viewControllerToPresent.modalPresentationStyle = UIModalPresentationCustom;
        _interactiveTransition = [[WHCustomPercentDrivenInteractiveTransition alloc] initWithVc:viewControllerToPresent type:self.type];
    }
    [super presentViewController:viewControllerToPresent animated:flag completion:completion];
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    if (self.type == kWHCustomAnimationTypePresent) {
        return nil;
    }else if (self.type == kWHCustomAnimationTypePush){
        return [[WHCustomPresentedAnimation alloc] initWithType:kWHCustomAnimationTypePush];
    }else{
        return [[WHCustomPresentedAnimation alloc] initWithType:kWHCustomAnimationTypeZoomPresent];
    }
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    if (self.type == kWHCustomAnimationTypePresent) {
        return nil;
    }else if (self.type == kWHCustomAnimationTypePush){
        return [[WHCustomDismissAnimation alloc] initWithType:kWHCustomAnimationTypePush];
    }else{
        return [[WHCustomDismissAnimation alloc] initWithType:kWHCustomAnimationTypeZoomPresent];
    }
}

-(id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator {
    return (self.interactiveTransition.isInteracting ? self.interactiveTransition : nil);
}

- (void)dealloc{
    NSLog(@"%@ dealloced", NSStringFromClass([self class]));
}

@end

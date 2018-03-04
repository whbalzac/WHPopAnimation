//
//  WHCustomPercentDrivenInteractiveTransition.h
//  swipeDismiss
//
//  Created by whbalzac on 27/02/2018.
//  Copyright © 2018 Zac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "WHCustomHeader.h"

@interface WHCustomPercentDrivenInteractiveTransition : UIPercentDrivenInteractiveTransition
@property (nonatomic, strong) UIViewController *vc;
@property (nonatomic, assign) BOOL isInteracting;
@property (nonatomic, assign) BOOL shouldComplete;

- (instancetype)initWithVc:(UIViewController *)vc type:(kWHCustomAnimationType)type;

@end

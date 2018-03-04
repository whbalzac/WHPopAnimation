//
//  WHPresentedAnimation.h
//  swipeDismiss
//
//  Created by whbalzac on 27/02/2018.
//  Copyright © 2018 Zac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "WHCustomHeader.h"

@interface WHCustomPresentedAnimation : NSObject <UIViewControllerAnimatedTransitioning>
- (instancetype)initWithType:(kWHCustomAnimationType)type;
@end

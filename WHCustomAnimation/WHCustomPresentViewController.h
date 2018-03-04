//
//  WHCustomViewController.h
//  swipeDismiss
//
//  Created by whbalzac on 27/02/2018.
//  Copyright © 2018 Zac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WHCustomHeader.h"

@interface WHCustomPresentViewController : UIViewController <UIViewControllerTransitioningDelegate>
- (instancetype)initWithType:(kWHCustomAnimationType)type;
@end

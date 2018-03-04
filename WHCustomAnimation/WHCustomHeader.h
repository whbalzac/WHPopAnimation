//
//  WHCustomHeader.h
//  swipeDismiss
//
//  Created by whbalzac on 27/02/2018.
//  Copyright © 2018 Zac. All rights reserved.
//

#ifndef WHCustomHeader_h
#define WHCustomHeader_h

#define WHCustomScreenWidth [[UIScreen mainScreen] bounds].size.width
#define WHCustomScreenHeight [[UIScreen mainScreen] bounds].size.height

typedef NS_ENUM(NSInteger, kWHCustomAnimationType){
    kWHCustomAnimationTypePresent = 0,
    kWHCustomAnimationTypePush = 1,
    kWHCustomAnimationTypeZoomPresent = 2
};

#endif /* WHCustomHeader_h */

//
//  UIViewController+Navigation.m
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 17/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "UIViewController+Navigation.h"

@implementation UIViewController (Navigation)

-(UINavigationController *) vosWrappedInNavigation{
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:self];

    return nav;
}

@end

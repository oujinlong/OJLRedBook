//
//  OUNavigationController.h
//  GWL
//
//  Created by oujinlong on 16/6/1.
//  Copyright © 2016年 oujinlong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OUNavAnimation.h"

@interface OUNavigationController : UINavigationController

-(void)pushViewController:(UIViewController *)viewController withImageView:(UIImageView*)imageView desRect:(CGRect)desRect delegate:(id <OUNavAnimationDelegate>) delegate;

@end

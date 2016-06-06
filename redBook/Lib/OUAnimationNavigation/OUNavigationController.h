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
/**
 *  小红书 Nav push
 *
 *  @param viewController 目标 VC
 *  @param imageView      动画ImageView
 *  @param desRect        imageView在 目标VC中的 rect
 *  @param delegate       目标VC 可能所需要实现的代理
 */
-(void)pushViewController:(UIViewController *)viewController withImageView:(UIImageView*)imageView desRect:(CGRect)desRect delegate:(id <OUNavAnimationDelegate>) delegate;

@end

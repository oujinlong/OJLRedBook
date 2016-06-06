//
//  OUNavAnimation.h
//  GWL
//
//  Created by oujinlong on 16/6/1.
//  Copyright © 2016年 oujinlong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol OUNavAnimationDelegate <NSObject>

-(void)didFinishTransition;

@end
@interface OUNavAnimation : NSObject <UIViewControllerAnimatedTransitioning>
@property (nonatomic, strong) UIImageView* imageView;
@property (nonatomic, assign) CGRect origionRect;
@property (nonatomic, assign) CGRect desRect;
@property (nonatomic, assign) BOOL isPush;
@property (nonatomic, weak) id <OUNavAnimationDelegate> delegate;
@end

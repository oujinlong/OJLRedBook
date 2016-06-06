//
//  OUNavAnimation.m
//  GWL
//
//  Created by oujinlong on 16/6/1.
//  Copyright © 2016年 oujinlong. All rights reserved.
// OJL

#import "OUNavAnimation.h"
#import "DetailViewController.h"
@interface OUNavAnimation ()
@property (nonatomic, weak) id<UIViewControllerContextTransitioning> transitionContext;
@end
@implementation OUNavAnimation
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.5;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    UIView* contentView = [transitionContext containerView];
    contentView.backgroundColor = [UIColor whiteColor];

    
    UIViewController* toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    
   __block UIImageView* imageView = [[UIImageView alloc] initWithImage:self.imageView.image];
    imageView.frame = self.isPush ? self.origionRect : self.desRect;
    [contentView addSubview:toVc.view];
    toVc.view.alpha = 0;

    [contentView addSubview:imageView];
    [UIView animateWithDuration:0.2 animations:^{
        toVc.view.alpha = 1.0f;
    }];
    
    UIImage* image = nil;
    if (!self.isPush) {
        image = [self.imageView.image copy];
        self.imageView.image = nil;
    }
    
    
    [UIView animateWithDuration:0.3 animations:^{
        imageView.frame = self.isPush ? self.desRect : self.origionRect;
    } completion:^(BOOL finished) {
        
        if ([self.delegate respondsToSelector:@selector(didFinishTransition)] && self.isPush) {
            [self.delegate didFinishTransition];
        }
        
        [transitionContext completeTransition:YES];

        [imageView removeFromSuperview];
        if (!self.isPush) {
            self.imageView.image = image;
        }
        imageView = nil;
    }];
    
    
    
}


@end

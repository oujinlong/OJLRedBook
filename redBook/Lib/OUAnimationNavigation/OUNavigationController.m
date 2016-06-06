//
//  OUNavigationController.m
//  GWL
//
//  Created by oujinlong on 16/6/1.
//  Copyright © 2016年 oujinlong. All rights reserved.
//

#import "OUNavigationController.h"
@interface OUNavigationController () <UINavigationControllerDelegate>
@property (nonatomic, strong) UIImageView* imageView;
@property (nonatomic, assign) CGRect origionRect;
@property (nonatomic, assign) CGRect desRect;
@property (nonatomic, assign) BOOL isPush;
@property (nonatomic, weak) id  animationDelegate;
@end

@implementation OUNavigationController

-(void)pushViewController:(UIViewController *)viewController withImageView:(UIImageView *)imageView desRect:(CGRect)desRect delegate:(id<OUNavAnimationDelegate>)delegate{
    
    self.delegate = self;
    self.imageView = imageView;
    self.origionRect = [imageView convertRect:imageView.frame toView:self.view];
    self.desRect = desRect;
    self.isPush = YES;
    self.animationDelegate = delegate;
    [super pushViewController:viewController animated:YES];
}
-(UIViewController *)popViewControllerAnimated:(BOOL)animated{
    self.isPush = NO;
   return  [super popViewControllerAnimated:animated];
}
-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    
    OUNavAnimation* animation = [[OUNavAnimation alloc] init];
    
    animation.imageView = self.imageView;

    animation.origionRect = self.origionRect;
    
    animation.desRect = self.desRect;
    
    animation.isPush = self.isPush;
    
    animation.delegate = self.animationDelegate;
    
    if (!self.isPush && self.delegate) {
        self.delegate = nil;
    }
    return animation;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

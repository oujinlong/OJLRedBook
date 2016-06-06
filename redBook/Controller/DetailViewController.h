//
//  DetailViewController.h
//  redBook
//
//  Created by oujinlong on 16/6/3.
//  Copyright © 2016年 oujinlong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OUNavAnimation.h"
#import "Model.h"
@interface DetailViewController : UIViewController <OUNavAnimationDelegate>
-(instancetype)initWithModel:(Model*)model desImageViewRect:(CGRect)desRect;;
@end

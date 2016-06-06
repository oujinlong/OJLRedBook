//
//  model.h
//  redBook
//
//  Created by oujinlong on 16/6/3.
//  Copyright © 2016年 oujinlong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Model : NSObject
@property (nonatomic, copy) NSString *h;
@property (nonatomic, copy) NSString *img;
@property (nonatomic, copy) NSString *des;
@property (nonatomic, copy) NSString *w;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *icon;
+(NSArray*)models;
-(CGSize)scaleSize;
@end

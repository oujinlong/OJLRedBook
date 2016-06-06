//
//  model.m
//  redBook
//
//  Created by oujinlong on 16/6/3.
//  Copyright © 2016年 oujinlong. All rights reserved.
//

#import "Model.h"
@implementation Model
+(NSArray *)models{
    NSMutableArray* array = [NSMutableArray array];
    
    NSArray* dicArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"1.plist" ofType:nil]];

    for (NSDictionary* dic in dicArray) {
        Model* m = [Model new];
        [m setValuesForKeysWithDictionary:dic];
        [array addObject:m];
    }
    
    return array;
}
-(CGSize)scaleSize{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat scale = width / [self.w floatValue];
    CGFloat height = [self.h floatValue] * scale;
    
    return CGSizeMake(width, height);
}

@end

//
//  OJLWaterLayout.h
//  redBook
//
//  Created by oujinlong on 16/6/3.
//  Copyright © 2016年 oujinlong. All rights reserved.
//

#import <UIKit/UIKit.h>


@class OJLWaterLayout;
@protocol OJLWaterLayoutDelegate <NSObject>

/**
 *  item 高度代理
 *
 *  @param OJLWaterLayout layout
 *  @param indexPath      indexPath
 *
 *  @return item高度
 */
-(CGFloat)OJLWaterLayout:(OJLWaterLayout*)OJLWaterLayout itemHeightForIndexPath:(NSIndexPath*)indexPath;

@end
@interface OJLWaterLayout : UICollectionViewLayout
@property (nonatomic, weak) id <OJLWaterLayoutDelegate> delegate;

/**
 *  每行之间的间距
 */
@property (nonatomic, assign) CGFloat rowPanding;
/**
 *  每列之间的间距
 */
@property (nonatomic, assign) CGFloat colPanding;
/**
 *  列数
 */
@property (nonatomic, assign) NSInteger numberOfCol;
/**
 *  contentSize
 */
@property (nonatomic, assign) CGSize contentSize;
/**
 *  自动配置 contentSize
 */
@property (nonatomic, assign) UIEdgeInsets sectionInset;
-(void)autuContentSize;
@end

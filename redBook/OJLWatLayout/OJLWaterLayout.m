//
//  OJLWaterLayout.m
//  redBook
//
//  Created by oujinlong on 16/6/3.
//  Copyright © 2016年 oujinlong. All rights reserved.
//

#import "OJLWaterLayout.h"

static CGFloat ColPanding =  10;
static CGFloat rowPanding = 10;
static NSInteger numberOfCol = 3;
static UIEdgeInsets edge ;

@interface OJLWaterLayout ()
@property (nonatomic, strong) NSMutableArray* attrArray;
@property (nonatomic, strong) NSMutableArray* lastHeightForColArray;
@property (nonatomic, assign) BOOL isAutoContentSize;
@end
@implementation OJLWaterLayout
- (NSMutableArray *)lastHeightForColArray
{
    if (!_lastHeightForColArray) {
        _lastHeightForColArray = [NSMutableArray array];
       
        
    }
    return _lastHeightForColArray;
}

- (NSMutableArray *)attrArray
{
    if (!_attrArray) {
        _attrArray = [NSMutableArray array];
    
    }
    return _attrArray;
}

-(void)prepareLayout{
    [super prepareLayout];
    
    ColPanding = self.colPanding == 0 ? ColPanding: self.colPanding;
    rowPanding = self.rowPanding == 0 ? rowPanding: self.rowPanding;
    numberOfCol = self.numberOfCol == 0 ? numberOfCol : self.numberOfCol;
    edge = self.sectionInset;
    
    
    [self.lastHeightForColArray removeAllObjects];
    for (NSInteger i = 0; i < numberOfCol; i++) {
        [self.lastHeightForColArray addObject:@(edge.top)];
    }
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    
    for (NSInteger i = 0 ; i < count; i++) {
        NSIndexPath* indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes* attr = [self layoutAttributesForItemAtIndexPath:indexPath];
        [self.attrArray addObject:attr];
    }
    
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    return self.attrArray;
}

-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewLayoutAttributes* attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
     CGFloat width = (self.collectionView.frame.size.width -  edge.left - edge.right - (numberOfCol - 1 ) * ColPanding) / numberOfCol;
    CGFloat height = 0;
   
    if ([self.delegate respondsToSelector:@selector(OJLWaterLayout:itemHeightForIndexPath:)]) {
        height = [self.delegate OJLWaterLayout:self itemHeightForIndexPath:indexPath];
    }
    
    
    CGFloat minY =  self.lastHeightForColArray.count ? [[self.lastHeightForColArray firstObject] floatValue] : edge.top;
    
    NSInteger currentCol = 0;
    for (NSInteger i = 1 ; i < self.lastHeightForColArray.count; i++) {
        if (minY > [self.lastHeightForColArray[i] floatValue]) {
            minY = [self.lastHeightForColArray[i] floatValue];
            currentCol = i;
        }
    }
    
    CGFloat x = edge.left + (width + ColPanding) * currentCol;
    CGFloat y = minY + rowPanding;
    
    
    
    
    attr.frame = CGRectMake(x, y, width, height);
    self.lastHeightForColArray[currentCol] = @(CGRectGetMaxY(attr.frame));
    if (self.isAutoContentSize) {
        
        CGFloat max = [[self.lastHeightForColArray firstObject] floatValue];
        
        for (NSInteger i = 1 ; i < self.lastHeightForColArray.count; i++) {
            if (max < [self.lastHeightForColArray[i] floatValue]) {
                max = [self.lastHeightForColArray[i] floatValue];
            }
        }

        
        self.contentSize = CGSizeMake(self.collectionView.bounds.size.width, max + edge.bottom);
    }
    return attr;
}
-(void)autuContentSize{
    self.isAutoContentSize = YES;
}
-(CGSize)collectionViewContentSize{
    return self.contentSize;
}
@end

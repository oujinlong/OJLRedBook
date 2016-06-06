//
//  OJLCollectionViewCell.h
//  redBook
//
//  Created by oujinlong on 16/6/3.
//  Copyright © 2016年 oujinlong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
@interface OJLCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) Model* model;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

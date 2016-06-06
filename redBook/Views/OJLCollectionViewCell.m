//
//  OJLCollectionViewCell.m
//  redBook
//
//  Created by oujinlong on 16/6/3.
//  Copyright © 2016年 oujinlong. All rights reserved.
//

#import "OJLCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "SDWebImageManager.h"
#import "Masonry.h"
@interface OJLCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@property (weak, nonatomic) IBOutlet UILabel *nameLB;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@end
@implementation OJLCollectionViewCell

- (void)awakeFromNib {
    [self.label layoutIfNeeded];
    
    UIView* line = [[UIView alloc] init];
    line.backgroundColor = [UIColor blackColor];
    line.alpha = 0.2;
    [self.contentView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(0.5);
        make.top.mas_equalTo(self.label.mas_bottom).offset(8);
    }];

    self.iconImageView.layer.cornerRadius = 11;
    self.iconImageView.layer.masksToBounds = YES;
}

-(void)setModel:(Model *)model{
    _model = model;
    
    [self.imageView  sd_setImageWithURL:[NSURL URLWithString:model.img] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        model.w = [NSString stringWithFormat:@"%.2f",image.size.width];
        model.h = [NSString stringWithFormat:@"%.2f",image.size.height];
        
    }];

    self.nameLB.text = model.name;
    
    self.label.text = model.des;
    
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:model.icon] placeholderImage:[UIImage imageNamed:@"chatListCellHead"]];
}
@end

//
//  DetailViewController.m
//  redBook
//
//  Created by oujinlong on 16/6/3.
//  Copyright © 2016年 oujinlong. All rights reserved.
//

#import "DetailViewController.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"
#import "SDWebImageManager.h"
@interface DetailViewController ()
@property (nonatomic, weak) UIImageView* avatarImageView;
@property (nonatomic, weak) UIButton* followButton;
@property (nonatomic, weak) UIImageView* contentImageView;
@property (nonatomic, weak) UILabel * contentLB;
@property (nonatomic, strong) Model* model;
@property (nonatomic, assign) CGRect desImageViewRect;
@property (nonatomic, weak) UILabel* nameLB;
@property (nonatomic, weak) UIScrollView* scrollView;
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    
}
-(instancetype)initWithModel:(Model *)model desImageViewRect:(CGRect)desRect{
    if (self = [super init]) {
        self.desImageViewRect = desRect;
        [self setupMain];
        self.model = model;
    }
    return self;
}
- (void)setupMain {
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIScrollView* scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView = scrollView;
    [self.view addSubview:scrollView];
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, 1000);
    
    
    UIImageView* avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5 + 64, 40, 40)];
    self.avatarImageView = avatarImageView;
    [scrollView addSubview:avatarImageView];
    self.avatarImageView.layer.cornerRadius = 20;
    self.avatarImageView.layer.masksToBounds = YES;
    
    
    UILabel* nameLB = [[UILabel alloc] init];
    self.nameLB = nameLB;
    nameLB.font = [UIFont systemFontOfSize:14];
    nameLB.textColor = [UIColor blackColor];
    [scrollView addSubview:nameLB];
    nameLB.frame = CGRectMake(CGRectGetMaxX(avatarImageView.frame) + 10, 84, 0, 0);
    
    
    UIButton* followButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [followButton setTitle:@"+ 关注" forState:UIControlStateNormal];
    [followButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [followButton setBackgroundColor:[[UIColor redColor] colorWithAlphaComponent:0.8]];
    followButton.titleLabel.font = [UIFont systemFontOfSize:12];
    followButton.layer.cornerRadius = 2;
    followButton.layer.masksToBounds = YES;
    [scrollView addSubview:followButton];
    [followButton addTarget:self action:@selector(followClick) forControlEvents:UIControlEventTouchUpInside];
    followButton.frame = CGRectMake(self.view.bounds.size.width - 70, 0, 60, 25);
    followButton.center = CGPointMake(followButton.center.x, avatarImageView.center.y);
    
    UIImageView* contentImageView = [[UIImageView alloc] init];
    self.contentImageView = contentImageView;
    [scrollView addSubview:contentImageView];
    contentImageView.frame = self.desImageViewRect;
    contentImageView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    
    UILabel* contentLB = [[UILabel alloc] init];
    self.contentLB = contentLB;
    contentLB.font = [UIFont systemFontOfSize:12];
    contentLB.textColor = [UIColor blackColor];
    contentLB.numberOfLines = 0;
    [scrollView addSubview:contentLB];
    [contentLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.width.mas_equalTo(scrollView.mas_width).offset(-20);
        make.top.mas_equalTo(contentImageView.mas_bottom).offset(15);
    }];
    
  
}

-(void)setModel:(Model *)model{
    _model = model;
    
    self.nameLB.text = model.name;
    [self.nameLB sizeToFit];

    [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:model.icon]];
    
    
    self.contentLB.text = model.des;
    [self.contentLB layoutIfNeeded];
    
    
    [self.scrollView setContentSize:CGSizeMake(self.view.bounds.size.width, CGRectGetMaxY(self.contentLB.frame) + 20)];
}

-(CGSize)scaleSizeWithImage:(UIImage*)image{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat scale = width / image.size.width;
    CGFloat height = image.size.height * scale;
    
    return CGSizeMake(width, height);
}
#pragma mark button action
-(void)followClick{
    
}
#pragma mark
-(void)didFinishTransition{
    [self.contentImageView sd_setImageWithURL:[NSURL URLWithString:self.model.img]];
}
@end

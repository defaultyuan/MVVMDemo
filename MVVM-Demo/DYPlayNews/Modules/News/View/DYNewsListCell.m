//
//  DYNewsListCell.m
//  DYPlayNews
//
//  Created by 袁斌 on 2017/6/1.
//  Copyright © 2017年 https://github.com/DefaultYuan All rights reserved.
//

#import "DYNewsListCell.h"
#import "DYNewsListCellModel.h"
#import "DYNews.h"

@interface DYNewsListCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *commentCount;
@end

@implementation DYNewsListCell

- (void)bindViewModel:(DYNewsListCellModel *)viewModel {

    DYNews *entity = viewModel.entity;
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:entity.imgsrc.firstObject]];
    [self.commentCount setTitle:[NSString stringWithFormat:@" %zd",entity.replyCount] forState:UIControlStateNormal];
    RAC(self.titleLabel, text) = [RACObserve(entity, title) takeUntil:self.rac_prepareForReuseSignal];
}

+ (CGSize)sizeForViewModel:(id<DYCellRenderProtocol>)viewModel constrainedToSize:(CGSize)size
{
    return CGSizeMake(size.width, 95);
}

@end

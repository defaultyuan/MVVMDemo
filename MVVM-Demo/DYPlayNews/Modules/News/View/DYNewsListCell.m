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

    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:viewModel.entity.imgsrc.firstObject]];
    [self.commentCount setTitle:[NSString stringWithFormat:@" %zd",viewModel.entity.replyCount] forState:UIControlStateNormal];
    RAC(self.titleLabel, text) = [RACObserve(viewModel.entity, title) takeUntil:self.rac_prepareForReuseSignal];
}

+ (CGFloat) heightForViewModel:(id<DYCellRenderProtocol>)viewModel
{
    return 95;
}

@end

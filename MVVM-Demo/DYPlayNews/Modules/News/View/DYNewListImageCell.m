//
//  DYNewListImageCell.m
//  DYPlayNews
//
//  Created by 袁斌 on 2017/6/3.
//  Copyright © 2017年 https://github.com/DefaultYuan . All rights reserved.
//

#import "DYNewListImageCell.h"
#import "DYNewsImageCellModel.h"
#import "DYNews.h"

@interface DYNewListImageCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *bigImageView;
@end

@implementation DYNewListImageCell

- (void)bindViewModel:(DYNewsImageCellModel *)viewModel {
    
    DYNews *entity = (DYNews *)viewModel.entity;
    [self.bigImageView sd_setImageWithURL:[viewModel fitSizeImageURLWithURL:entity.imgsrc.firstObject]];
    RAC(self.titleLabel, text) = [RACObserve(entity, title) takeUntil:self.rac_prepareForReuseSignal];
}

+ (CGSize)sizeForViewModel:(id<DYCellRenderProtocol>)viewModel constrainedToSize:(CGSize)size
{
    return CGSizeMake(size.width, 170);
}

@end

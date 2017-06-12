//
//  DYRecommendCollectionCell.m
//  DYPlayNews
//
//  Created by 袁斌 on 2017/6/6.
//  Copyright © 2017年 https://github.com/DefaultYuan . All rights reserved.
//

#import "DYRecommendCollectionCell.h"
#import "DYRecommendCellModel.h"
#import "DYRecommendEntity.h"

@interface DYRecommendCollectionCell ()

@property (weak, nonatomic) IBOutlet UIImageView *topImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@end

@implementation DYRecommendCollectionCell

- (void)bindViewModel:(DYRecommendCellModel *)viewModel
{
    DYRecommendEntity *entity = viewModel.entity;
    RAC(self.titleLabel, text) = [RACObserve(entity, topicName) takeUntil:self.rac_prepareForReuseSignal];
    [self.topImageView sd_setImageWithURL:[viewModel fitSizeImageURLWithURL:entity.iconUrl]];

}

+ (CGSize)sizeForViewModel:(id<DYCellRenderProtocol>)viewModel constrainedToSize:(CGSize)size
{
    CGFloat WH = size.width / 3.0 - 5;
    return CGSizeMake(WH, WH);
}

@end

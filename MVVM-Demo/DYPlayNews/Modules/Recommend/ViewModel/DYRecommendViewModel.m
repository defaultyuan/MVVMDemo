//
//  DYRecommendViewModel.m
//  DYPlayNews
//
//  Created by 袁斌 on 2017/6/1.
//  Copyright © 2017年 https://github.com/DefaultYuan All rights reserved.
//

#import "DYRecommendViewModel.h"
#import "DYClient+Recommend.h"
#import "DYRecommendEntity.h"
#import "DYRecommendCellModel.h"

@implementation DYRecommendViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        RAC(self, dataSource) = [self.fetchDataCommand.executionSignals.switchToLatest map:^id(NSArray *recommends) {
            return [recommends.rac_sequence map:^id(DYRecommendEntity *entity) {
                return [[DYRecommendCellModel alloc] initWithEntity:entity];
            }].array;
        }];
        
    }
    return self;
}

- (RACSignal *)fetchNewData
{
    DYClient *client = [DYClient new];
    return [client fetchRecommendTopicList];
}

@end

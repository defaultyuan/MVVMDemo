//
//  DYNewsViewModel.m
//  DYPlayNews
//
//  Created by 袁斌 on 2017/6/1.
//  Copyright © 2017年 https://github.com/DefaultYuan All rights reserved.
//

#import "DYNewsViewModel.h"
#import "DYClient+News.h"
#import "DYNews.h"
#import "DYNewsListCellModel.h"

@interface DYNewsViewModel ()

@end

@implementation DYNewsViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {

        RAC(self, dataSource) = [self.fetchDataCommand.executionSignals.switchToLatest map:^id(NSArray *news) {
            return [news.rac_sequence map:^id(DYNews *e) {
                return [[DYNewsListCellModel alloc] initWithEntity:e];
            }].array;
        }];
        
    }
    return self;
}

- (RACSignal *)fetchNewData
{
    DYClient *client = [DYClient new];
    client.topId = self.topId;
    client.pageIndex = 4;
    client.pageSize = 20;
    return [client fetchNewsData];
}

@end

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

@property (nonatomic) NSArray *news; /**< 新闻列表 */
@end

@implementation DYNewsViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {

        RAC(self, news) = [self.fetchDataCommand.executionSignals.switchToLatest doNext:^(NSArray *news)
        {
            NSMutableArray *datas = [NSMutableArray array];
            for (DYNews *e in news) {
                DYNewsListCellModel *vm = [[DYNewsListCellModel alloc] initWithEntity:e];
                [datas addObject:vm];
            }
            self.dataSource = [datas copy];
            NSLog(@"dataSource:%@",self.dataSource);
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

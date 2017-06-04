//
//  DYBaseViewModel.m
//  DYPlayNews
//
//  Created by 袁斌 on 2017/5/25.
//  Copyright © 2017年 https://github.com/DefaultYuan All rights reserved.
//

#import "DYBaseViewModel.h"

@implementation DYBaseViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.dataSource = [NSArray array];
        
        _fetchDataCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
            return [[self fetchNewData] takeUntil:self.rac_willDeallocSignal];
        }];
    }
    return self;
}

- (NSString *)cellIdentifier { return nil; }

@end

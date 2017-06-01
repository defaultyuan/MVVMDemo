//
//  DYNewsViewModel.m
//  DYPlayNews
//
//  Created by 袁斌 on 2017/6/1.
//  Copyright © 2017年 https://github.com/DefaultYuan. All rights reserved.
//

#import "DYNewsViewModel.h"

@implementation DYNewsViewModel

- (RACSignal *)fetchNewsDataWithId:(NSString *)topId pageIndex:(NSUInteger)pageIndex
{
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        self.pageSize = 20;
        NSString *newURL = [NSString stringWithFormat:@"%@/%@/%zd/%zd",NewsListURLString,topId,pageIndex * self.pageSize, self.pageSize];
        
        [[DYRequestManager manager] doRequestMethod:@"get" url:newURL params:nil success:^(id responseObject) {
            [subscriber sendNext:nil];
            [subscriber sendCompleted];
        } failure:^(NSError *error) {
            [subscriber sendError:error];
        }];
        
        return nil;
    }];
}

- (RACSignal *)fetchNewsDetailWithId:(NSString *)newsId
{
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSString *newsDetailURL = [NSString stringWithFormat:@"%@/%@",NewsDetailURLString, newsId];
        [[DYRequestManager manager] doRequestMethod:@"get" url:newsDetailURL params:@{@"tieVersion":@"v2",@"platform":@"ios",@"width":@(CGRectGetWidth([UIScreen mainScreen].bounds) * 2),@"height":@(CGRectGetHeight([UIScreen mainScreen].bounds) * 2),@"decimal":@"75"} success:^(id responseObject) {
            [subscriber sendNext:nil];
            [subscriber sendCompleted];
        } failure:^(NSError *error) {
            [subscriber sendError:error];
        }];
        return nil;
    }];
}

@end

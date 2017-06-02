//
//  DYClient+News.m
//  DYPlayNews
//
//  Created by 袁斌 on 2017/6/2.
//  Copyright © 2017年 https://github.com/DefaultYuan. All rights reserved.
//

#import "DYClient+News.h"

@implementation DYClient (News)

- (RACSignal *)fetchNewsData
{
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSParameterAssert(self.topId!=nil);
        NSParameterAssert(self.pageIndex!=0);
        NSParameterAssert(self.pageSize!=0);
        
        NSString *newURL = [NSString stringWithFormat:@"%@/%@/%zd/%zd",NewsListURLString,self.topId,self.pageIndex * self.pageSize, self.pageSize];
        [[DYRequestManager manager] doRequestMethod:@"get" url:newURL params:nil success:^(id responseObject) {
            [subscriber sendNext:responseObject];
            [subscriber sendCompleted];
        } failure:^(NSError *error) {
            [subscriber sendError:error];
        }];
        return nil;
    }];

}

- (RACSignal *)fetchNewsDetail
{
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSString *newsDetailURL = [NSString stringWithFormat:@"%@/%@",NewsDetailURLString, self.newsId];
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

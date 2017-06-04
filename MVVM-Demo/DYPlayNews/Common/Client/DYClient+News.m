//
//  DYClient+News.m
//  DYPlayNews
//
//  Created by 袁斌 on 2017/6/2.
//  Copyright © 2017年 https://github.com/DefaultYuan All rights reserved.
//

#import "DYClient+News.h"
#import "DYNews.h"

@implementation DYClient (News)

- (RACSignal *)fetchNewsData
{
    NSString *newURL = [NSString stringWithFormat:@"%@/%@/%zd/%zd",NewsListURLString,self.topId,self.pageIndex * self.pageSize, self.pageSize];
    return [self requestWithMethod:@"get" url:newURL params:nil responseClass:[DYNews class]];
}

- (RACSignal *)fetchNewsDetail
{
    NSString *newsDetailURL = [NSString stringWithFormat:@"%@/%@",NewsDetailURLString, self.newsId];
    return [self requestWithMethod:@"get" url:newsDetailURL
                            params:@{@"tieVersion":@"v2",@"platform":@"ios",@"width":@(CGRectGetWidth([UIScreen mainScreen].bounds) * 2),@"height":@(CGRectGetHeight([UIScreen mainScreen].bounds) * 2),@"decimal":@"75"}
                     responseClass:[NSObject class]];
}

@end

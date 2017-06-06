//
//  DYClient+Recommend.m
//  DYPlayNews
//
//  Created by 袁斌 on 2017/6/2.
//  Copyright © 2017年 https://github.com/DefaultYuan All rights reserved.
//

#import "DYClient+Recommend.h"
#import "DYRecommendEntity.h"

@implementation DYClient (Recommend)

- (RACSignal *)fetchRecommendTopicList
{
    return [self requestWithMethod:@"get" url:NewsRecommendTopicURLString params:nil responseClass:[DYRecommendEntity class]];
}

- (RACSignal *)fetchRecommendImageInfos
{
    return [self requestWithMethod:@"get" url:NewsRecommendImageInfosURLString params:nil responseClass:[NSObject class]];
}


@end

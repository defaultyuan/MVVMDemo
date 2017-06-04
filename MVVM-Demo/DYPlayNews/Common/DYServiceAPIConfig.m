//
//  DYServiceAPIConfig.m
//  DYPlayNews
//
//  Created by 袁斌 on 2017/6/1.
//  Copyright © 2017年 https://github.com/DefaultYuan All rights reserved.
//

#import "DYServiceAPIConfig.h"

@implementation DYServiceAPIConfig

+ (instancetype)shared
{
    static DYServiceAPIConfig *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _newsInfoArray = @[@{ @"topId" : @"",
                              @"title" : @"头条"},
                           @{ @"topId" : @"T1461396384709",
                              @"title" : @"网游"},
                           @{ @"topId" : @"T1461396358842",
                              @"title" : @"手游"},
                           @{ @"topId" : @"T1461396291717",
                              @"title" : @"主机"},
                           @{ @"topId" : @"T1461396413033",
                              @"title" : @"电竞"},
                           @{ @"topId" : @"T1461396489605",
                              @"title" : @"暴雪"}];
    }
    return self;
}

@end

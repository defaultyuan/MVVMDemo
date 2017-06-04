//
//  YYCache+DYY.m
//  DYPlayNews
//
//  Created by 袁斌 on 2017/6/3.
//  Copyright © 2017年 https://github.com/DefaultYuan All rights reserved.
//

#import "YYCache+DYY.h"

@implementation YYCache (DYY)

+ (instancetype)shared {
    static YYCache *sharedCache = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedCache = [YYCache cacheWithName:@"com.github.defaultyuan"];
    });
    return sharedCache;
}

@end

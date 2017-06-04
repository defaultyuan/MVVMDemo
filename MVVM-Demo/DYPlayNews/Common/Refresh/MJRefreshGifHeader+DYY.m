//
//  MJRefreshGifHeader+DYY.m
//  DYPlayNews
//
//  Created by 袁斌 on 2017/6/3.
//  Copyright © 2017年 https://github.com/DefaultYuan . All rights reserved.
//

#import "MJRefreshGifHeader+DYY.h"

@implementation MJRefreshGifHeader (DYY)

+ (instancetype)DYHeaderWithRefreshingBlock:(MJRefreshComponentRefreshingBlock)refreshingBlock
{
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingBlock:refreshingBlock];
    
    NSArray *idleImages = [self imagesForRefresh];
    NSArray *refreshingImages = [self imagesForRefresh];
    
    [header setImages:idleImages forState:MJRefreshStateIdle]; // 设置下拉过程的动画图片
    [header setImages:refreshingImages forState:MJRefreshStatePulling]; // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
    [header setImages:refreshingImages forState:MJRefreshStateRefreshing]; // 设置正在刷新状态的动画图片
    header.lastUpdatedTimeLabel.hidden = YES; // 隐藏时间
    header.stateLabel.hidden = YES; // 隐藏状态
    
    return header;
}


+ (NSArray *) imagesForRefresh
{
    static NSArray *images = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSMutableArray *refreshImages = [NSMutableArray array];
        for (NSUInteger i = 1; i<5; i++) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"refresh%zd", i]];
            [refreshImages addObject:image];
        }
        images = [refreshImages copy];
    });
    return images;
}

@end

//
//  DYClient.h
//  DYPlayNews
//
//  Created by 袁斌 on 2017/6/2.
//  Copyright © 2017年 https://github.com/DefaultYuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "DYRequestManager.h"

extern NSString *const NewsListURLString;
extern NSString *const NewsDetailURLString;

extern NSString *const NewsRecommendTopicURLString;
extern NSString *const NewsRecommendImageInfosURLString;

extern NSString *const HotGameZoneURLString;
extern NSString *const ZoneDiscuzURLString;
extern NSString *const DiscuzDetailURLString;
extern NSString *const ZoneDiscuzImageURLString;

@interface DYClient : NSObject

@property (nonatomic, copy) NSString *topId;
@property (nonatomic, assign) NSUInteger pageIndex;
@property (nonatomic, assign) NSUInteger pageSize;
@property (nonatomic, copy) NSString *newsId;
@property (nonatomic, copy) NSString *fid;
@property (nonatomic, copy) NSString *tid;
@end

//
//  DYBaseViewModel.h
//  DYPlayNews
//
//  Created by 袁斌 on 2017/5/25.
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

@interface DYBaseViewModel : NSObject

@property (nonatomic)  NSUInteger pageSize;
@end

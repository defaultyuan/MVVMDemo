//
//  DYRecommendEntity.h
//  DYPlayNews
//
//  Created by 袁斌 on 2017/6/6.
//  Copyright © 2017年 https://github.com/DefaultYuan . All rights reserved.
//

#import "DYBaseEntity.h"

@interface DYRecommendEntity : DYBaseEntity

@property (nonatomic, copy) NSString *bannerUrl;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *iconUrl;
@property (nonatomic, copy) NSString *topicIconName;
@property (nonatomic, copy) NSString *topicId;
@property (nonatomic, copy) NSString *topicName;
@property (nonatomic, assign) NSInteger followUserCount;
@property (nonatomic, assign) NSInteger platform;
@property (nonatomic, assign) NSInteger sourceType;
@end

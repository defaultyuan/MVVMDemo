//
//  DYNews.h
//  DYPlayNews
//
//  Created by 袁斌 on 2017/5/25.
//  Copyright © 2017年 https://github.com/DefaultYuan. All rights reserved.
//

#import "DYBaseEntity.h"

@interface DYNews : DYBaseEntity

@property (nonatomic, copy) NSString *digest;
@property (nonatomic, copy) NSString *docid;
@property (nonatomic, copy) NSArray *imgextra;
@property (nonatomic, copy) NSArray *imgsrc;
@property (nonatomic, copy) NSString *ltitle;
@property (nonatomic, copy) NSString *postid;
@property (nonatomic, assign) NSInteger priority;
@property (nonatomic, copy) NSString *ptime;
@property (nonatomic, assign) NSInteger replyCount;
@property (nonatomic, assign) NSInteger showType;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *topicId;
@end

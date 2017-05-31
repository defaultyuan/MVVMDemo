//
//  DYNewsDetailInfo.h
//  DYPlayNews
//
//  Created by 袁斌 on 2017/5/25.
//  Copyright © 2017年 https://github.com/DefaultYuan. All rights reserved.
//

#import "DYBaseEntity.h"

@interface DYNewsDetailInfo : DYBaseEntity

@property (nonatomic, strong) DYNewsDetailInfo *article;
//@property (nonatomic, strong) LPNewsCommentModel *tie;
@end


@interface DYNewsArticleInfo : DYBaseEntity

@property (nonatomic, copy) NSString *articleUrl;
@property (nonatomic, copy) NSString *body;
@property (nonatomic, copy) NSString *digest;
@property (nonatomic, copy) NSString *docid;
@property (nonatomic, copy) NSArray *img;
@property (nonatomic, copy) NSString *ptime;
@property (nonatomic, assign) NSInteger replyCount;
@property (nonatomic, copy) NSString *shareLink;
@property (nonatomic, copy) NSString *source;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSArray *relative_sys;
@end

@interface DYNewsImgeInfo : DYBaseEntity

@property (nonatomic, copy) NSString *alt;
@property (nonatomic, copy) NSString *pixel;
@property (nonatomic, copy) NSString *ref;
@property (nonatomic, copy) NSString *src;
@end

@interface DYNewsFavorInfo : DYBaseEntity

@property (nonatomic, copy) NSString *docID;
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *imgsrc;
@property (nonatomic, copy) NSString *ptime;
@property (nonatomic, copy) NSString *source;
@property (nonatomic, copy) NSString *title;
@end

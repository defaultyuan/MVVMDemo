//
//  DYNews.h
//  DYPlayNews
//
//  Created by 袁斌 on 2017/5/25.
//  Copyright © 2017年 https://github.com/DefaultYuan All rights reserved.
//

#import "DYBaseEntity.h"

/*
 {
 "articleTags": "",
 "digest": "",
 "docid": "CLEDM16U00318PFI",
 "fromTopicSource": false,
 "gameName": "",
 "id": 72810,
 "imgsrc": [
 "http://cms-bucket.nosdn.127.net/fa09f8a5aeb1422b8c74949e4479b1ad20170527094552.png"
 ],
 "lmodify": "2017-05-27 09:52:40",
 "newTopicId": 35,
 "photosetId": "",
 "photosetImgNum": 0,
 "priority": 70,
 "ptime": "2017-05-27 09:45:54",
 "readSeconds": 3,
 "replyCount": 675,
 "showType": 5,
 "source": "",
 "specialId": "",
 "subtitle": "",
 "title": "《GTA OL》6月大型更新揭秘 玩家可从事军火贸易",
 "topicId": "T1461396384709",
 "topicName": "网游",
 "url": "http://play.163.com/17/0527/09/CLEDM16U00318PFI.html",
 "userId": 0,
 "userOrder": false
 }
 */

@interface DYNews : DYBaseEntity

@property (nonatomic, copy) NSString *digest;
@property (nonatomic, copy) NSString *docid;
@property (nonatomic, copy) NSArray *imgextra;
@property (nonatomic, copy) NSArray *imgsrc;
@property (nonatomic, copy) NSString *ltitle;
@property (nonatomic, copy) NSString *postId;
@property (nonatomic, assign) NSInteger priority;
@property (nonatomic, copy) NSString *ptime;
@property (nonatomic, assign) NSInteger replyCount;
@property (nonatomic, assign) NSInteger showType;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *topicId;
@end

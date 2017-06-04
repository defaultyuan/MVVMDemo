//
//  DYClient.m
//  DYPlayNews
//
//  Created by 袁斌 on 2017/6/2.
//  Copyright © 2017年 https://github.com/DefaultYuan All rights reserved.
//

#import "DYClient.h"
#import "Mantle.h"

NSString *const NewsListURLString = @"/user/article/list/";
NSString *const NewsDetailURLString = @"/news/appDetail/";
NSString *const NewsRecommendTopicURLString = @"/news/topicOrderSource/list";
NSString *const NewsRecommendImageInfosURLString = @"/news/config/config_focus_img/list/";

NSString *const HotGameZoneURLString = @"/news/discuz/forum_recommend_detail";
NSString *const ZoneDiscuzURLString = @"/news/discuz/discuz_model_v2/list/center";
NSString *const DiscuzDetailURLString = @"http://bbs.d.163.com/api/mobile/index.php";
NSString *const ZoneDiscuzImageURLString = @"/news/discuz/discuz_model/fid_img";

@implementation DYClient

- (RACSignal *)requestWithMethod:(NSString *)method url:(NSString *)urlString params:(id)params responseClass:(Class)responseCls
{
    return [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [[DYRequestManager manager] doRequestMethod:method url:urlString params:params success:^(id responseObject) {
            NSDictionary *responseDict = (NSDictionary *)responseObject;
            
            NSInteger code = [[responseDict objectForKey:@"code"] integerValue];
            id info = [responseDict objectForKey:@"info"];
            id infoObject;
            
            if (code == 0) {
                if ([info isKindOfClass:[NSArray class]]) {
                   infoObject = [MTLJSONAdapter modelsOfClass:responseCls fromJSONArray:(NSArray *)info error:NULL];
                }
                else if ([info isKindOfClass:[NSDictionary class]]) {
                    infoObject = [MTLJSONAdapter modelOfClass:responseCls fromJSONDictionary:(NSDictionary *)info error:NULL];
                }
                else { }
                
                [subscriber sendNext:infoObject];
                [subscriber sendCompleted];
            }
            
            else {
                
                [subscriber sendError:[NSError new]];
            }
            
        } failure:^(NSError *error) {
            [subscriber sendError:error];
        }];
        return nil;
    }] doNext:^(id x) {
//        NSLog(@"xxxxxxxxx:%@",[[(NSArray *)x firstObject] class]);
    }];
}

@end

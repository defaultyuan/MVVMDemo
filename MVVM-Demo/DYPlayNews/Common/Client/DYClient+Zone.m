//
//  DYClient+Zone.m
//  DYPlayNews
//
//  Created by 袁斌 on 2017/6/2.
//  Copyright © 2017年 https://github.com/DefaultYuan. All rights reserved.
//

#import "DYClient+Zone.h"

@implementation DYClient (Zone)


- (RACSignal *) fetchHotZone
{
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        self.pageSize = 20;
        NSString *hotZoneURL = [NSString stringWithFormat:@"%@/%zd/%zd",HotGameZoneURLString, self.pageIndex, self.pageSize];
        [[DYRequestManager manager] doRequestMethod:@"get" url:hotZoneURL params:nil success:^(id responseObject) {
            [subscriber sendNext:nil];
            [subscriber sendCompleted];
        } failure:^(NSError *error) {
            [subscriber sendError:error];
        }];
        return nil;
    }];

}

- (RACSignal *) fetchZoneDiscuz
{
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSString *zoneDiscuzURL = [NSString stringWithFormat:@"%@/%zd",ZoneDiscuzURLString, self.pageIndex];
        [[DYRequestManager manager] doRequestMethod:@"get" url:zoneDiscuzURL params:nil success:^(id responseObject) {
            [subscriber sendNext:nil];
            [subscriber sendCompleted];
        } failure:^(NSError *error) {
            [subscriber sendError:error];
        }];
        return nil;
    }];

}

- (RACSignal *) fetchDiscuzImage
{
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSString *discuzImageURL = [NSString stringWithFormat:@"%@/%@",ZoneDiscuzImageURLString, self.fid];
        [[DYRequestManager manager] doRequestMethod:@"get" url:discuzImageURL params:nil success:^(id responseObject) {
            [subscriber sendNext:nil];
            [subscriber sendCompleted];
        } failure:^(NSError *error) {
            [subscriber sendError:error];
        }];
        return nil;
    }];

}

- (RACSignal *) fetchDiscuzList
{
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [[DYRequestManager manager] doRequestMethod:@"get" url:DiscuzDetailURLString params:@{@"version":@"163",@"module":@"forumdisplay",@"fid":self.fid?self.fid:@"",@"tpp":@"15",@"charset":@"utf-8",@"page":@(self.pageIndex).stringValue} success:^(id responseObject) {
            [subscriber sendNext:nil];
            [subscriber sendCompleted];
        } failure:^(NSError *error) {
            [subscriber sendError:error];
        }];
        return nil;
    }];

}

- (RACSignal *) fetchDiscuzDetail
{
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [[DYRequestManager manager] doRequestMethod:@"get" url:DiscuzDetailURLString params:@{@"version":@"163",@"module":@"viewthread",@"tid":self.tid?self.tid:@"",@"ppp":@(self.pageSize).stringValue,@"charset":@"utf-8",@"page":@(self.pageIndex).stringValue} success:^(id responseObject) {
            [subscriber sendNext:nil];
            [subscriber sendCompleted];
        } failure:^(NSError *error) {
            [subscriber sendError:error];
        }];
        return nil;
    }];

}
@end

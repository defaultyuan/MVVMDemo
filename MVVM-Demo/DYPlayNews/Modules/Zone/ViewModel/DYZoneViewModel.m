//
//  DYZoneViewModel.m
//  DYPlayNews
//
//  Created by 袁斌 on 2017/6/1.
//  Copyright © 2017年 https://github.com/DefaultYuan. All rights reserved.
//

#import "DYZoneViewModel.h"

@implementation DYZoneViewModel

- (RACSignal *)fetchHotZoneWithPageIndex:(NSUInteger)pageIndex
{
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        self.pageSize = 20;
        NSString *hotZoneURL = [NSString stringWithFormat:@"%@/%zd/%zd",HotGameZoneURLString, pageIndex, self.pageSize];
        [[DYRequestManager manager] doRequestMethod:@"get" url:hotZoneURL params:nil success:^(id responseObject) {
            [subscriber sendNext:nil];
            [subscriber sendCompleted];
        } failure:^(NSError *error) {
            [subscriber sendError:error];
        }];
        return nil;
    }];
}

- (RACSignal *)fetchZoneDiscuzWithIndex:(NSUInteger)index
{
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSString *zoneDiscuzURL = [NSString stringWithFormat:@"%@/%zd",ZoneDiscuzURLString, index];
        [[DYRequestManager manager] doRequestMethod:@"get" url:zoneDiscuzURL params:nil success:^(id responseObject) {
            [subscriber sendNext:nil];
            [subscriber sendCompleted];
        } failure:^(NSError *error) {
            [subscriber sendError:error];
        }];
        return nil;
    }];
}

- (RACSignal *)fetchDiscuzImageWithFid:(NSString *)fid
{
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSString *discuzImageURL = [NSString stringWithFormat:@"%@/%@",ZoneDiscuzImageURLString, fid];
        [[DYRequestManager manager] doRequestMethod:@"get" url:discuzImageURL params:nil success:^(id responseObject) {
            [subscriber sendNext:nil];
            [subscriber sendCompleted];
        } failure:^(NSError *error) {
            [subscriber sendError:error];
        }];
        return nil;
    }];
}

- (RACSignal *)fetchDiscuzListWithFid:(NSString *)fid index:(NSUInteger)index
{
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [[DYRequestManager manager] doRequestMethod:@"get" url:DiscuzDetailURLString params:@{@"version":@"163",@"module":@"forumdisplay",@"fid":fid?fid:@"",@"tpp":@"15",@"charset":@"utf-8",@"page":@(index).stringValue} success:^(id responseObject) {
            [subscriber sendNext:nil];
            [subscriber sendCompleted];
        } failure:^(NSError *error) {
            [subscriber sendError:error];
        }];
        return nil;
    }];
}


- (RACSignal *)fetchDiscuzDetailWithTid:(NSString *)tid index:(NSUInteger)index pageSize:(NSUInteger)pageSize
{
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [[DYRequestManager manager] doRequestMethod:@"get" url:DiscuzDetailURLString params:@{@"version":@"163",@"module":@"viewthread",@"tid":tid?tid:@"",@"ppp":@(pageSize).stringValue,@"charset":@"utf-8",@"page":@(index).stringValue} success:^(id responseObject) {
            [subscriber sendNext:nil];
            [subscriber sendCompleted];
        } failure:^(NSError *error) {
            [subscriber sendError:error];
        }];
        return nil;
    }];
}

@end

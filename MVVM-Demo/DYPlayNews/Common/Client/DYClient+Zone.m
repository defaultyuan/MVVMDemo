//
//  DYClient+Zone.m
//  DYPlayNews
//
//  Created by 袁斌 on 2017/6/2.
//  Copyright © 2017年 https://github.com/DefaultYuan All rights reserved.
//

#import "DYClient+Zone.h"

@implementation DYClient (Zone)

- (RACSignal *) fetchHotZone
{
    NSString *hotZoneURL = [NSString stringWithFormat:@"%@/%zd/%zd",HotGameZoneURLString, self.pageIndex, self.pageSize];
    return [self requestWithMethod:@"get" url:hotZoneURL params:nil responseClass:[NSObject class]];
}

- (RACSignal *) fetchZoneDiscuz
{
    NSString *zoneDiscuzURL = [NSString stringWithFormat:@"%@/%zd",ZoneDiscuzURLString, self.pageIndex];
    return [self requestWithMethod:@"get" url:zoneDiscuzURL params:nil responseClass:[NSObject class]];
}

- (RACSignal *) fetchDiscuzImage
{
    NSString *discuzImageURL = [NSString stringWithFormat:@"%@/%@",ZoneDiscuzImageURLString, self.fid];
    return [self requestWithMethod:@"get" url:discuzImageURL params:nil responseClass:[NSObject class]];
}

- (RACSignal *) fetchDiscuzList
{
    return [self requestWithMethod:@"get" url:DiscuzDetailURLString
                            params:@{@"version":@"163",@"module":@"forumdisplay",@"fid":self.fid?self.fid:@"",@"tpp":@"15",@"charset":@"utf-8",@"page":@(self.pageIndex).stringValue}
                     responseClass:[NSObject class]];
}

- (RACSignal *) fetchDiscuzDetail
{
    return [self requestWithMethod:@"get" url:DiscuzDetailURLString
                            params:@{@"version":@"163",@"module":@"viewthread",@"tid":self.tid?self.tid:@"",@"ppp":@(self.pageSize).stringValue,@"charset":@"utf-8",@"page":@(self.pageIndex).stringValue}
                     responseClass:[NSObject class]];
}
@end

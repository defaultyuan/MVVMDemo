//
//  DYRequestManager.m
//  DYPlayNews
//
//  Created by 袁斌 on 2017/5/31.
//  Copyright © 2017年 https://github.com/DefaultYuan. All rights reserved.
//

#import "DYRequestManager.h"
#import "AFNetworking.h"

@interface DYRequestManager ()

@property (nonatomic, strong) AFHTTPRequestOperationManager *manager;
@end

@implementation DYRequestManager

+ (instancetype)manager
{
    DYRequestManager *requestManager = [[self alloc] init];
    requestManager.manager = [AFHTTPRequestOperationManager manager];
    return requestManager;
}

- (void)doRequestMethod:(NSString *)method
                    url:(NSString *)urlString
                 params:(id)params
                success:(void (^)(id))success
                failure:(void (^)(NSError *))failure
{
    self.manager.requestSerializer = [AFJSONRequestSerializer serializer];
    self.manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    NSString *_allURLString = [self _allURLStringWithPackURLString:urlString];
    NSDictionary *paramDict;
    if ([params isKindOfClass:[NSDictionary class]]) {
         paramDict = (NSDictionary *)params;
    }
    
    method = [method lowercaseString];
    if ([method isEqualToString:@"post"]) {

        [self.manager POST:_allURLString
                parameters:paramDict
                   success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
                       NSDictionary *responseDict = [self dictionaryWithRespondData:responseObject];
                       success(responseDict);  }
                   failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
                       failure(error);  }];
        
    }
    
    else if ([method isEqualToString:@"get"]){
        
        [self.manager GET:_allURLString
               parameters:paramDict
                  success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
                      NSDictionary *responseDict = [self dictionaryWithRespondData:responseObject];
                      success(responseDict); }
                  failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
                      failure(error); }];
    }
    
    else { }
}

- (NSString *)_allURLStringWithPackURLString:(NSString *)URLStr
{
    NSString *baseURLString = @"http://i.play.163.com";
    return [baseURLString stringByAppendingString:URLStr];
}

- (NSDictionary *)dictionaryWithRespondData:(NSData *)data
{
    NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return [self dictionaryWithJSON:str];
}

- (NSDictionary *)dictionaryWithJSON:(NSString *)jsonString
{
    NSDictionary *JSON;
    if (jsonString && ![jsonString isEqual:[NSNull null]]) {
        NSError *error;
        JSON = [NSJSONSerialization JSONObjectWithData:[jsonString dataUsingEncoding:NSUTF8StringEncoding]
                                               options:NSJSONReadingMutableContainers
                                                 error:&error];
    }
    return JSON;
}

@end

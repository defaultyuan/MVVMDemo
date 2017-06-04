//
//  DYRequestManager.h
//  DYPlayNews
//
//  Created by 袁斌 on 2017/5/31.
//  Copyright © 2017年 https://github.com/DefaultYuan All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DYRequestManager : NSObject

+ (instancetype) manager;

- (void) doRequestMethod:(NSString *)method
                     url:(NSString *)urlString
                  params:(id)params
                 success:(void (^)(id responseObject))success
                 failure:(void (^)(NSError *error))failure;
@end

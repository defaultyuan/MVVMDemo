//
//  DYBaseCellModel.m
//  DYPlayNews
//
//  Created by 袁斌 on 2017/6/6.
//  Copyright © 2017年 https://github.com/DefaultYuan . All rights reserved.
//

#import "DYBaseCellModel.h"

@class ObjectType;
@implementation DYBaseCellModel

- (instancetype)initWithEntity:(ObjectType*)newsEntity
{
    self = [super init];
    if (self) {
        
        _entity = newsEntity;
        
    }
    return self;
}

- (NSURL *)fitSizeImageURLWithURL:(NSString *)url
{
    return [NSURL URLWithString:[NSString stringWithFormat:@"%@?w=750&h=20000&quality=75",url]];
}

@end

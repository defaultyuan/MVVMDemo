//
//  DYHeader.h
//  DYPlayNews
//
//  Created by 袁斌 on 2017/6/3.
//  Copyright © 2017年 https://github.com/DefaultYuan All rights reserved.
//

#ifndef DYHeader_h
#define DYHeader_h

#if 1
#define NSLog(fmt, ...) NSLog((@"%s [ LINE %d ]\n" fmt), [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String],__LINE__, ##__VA_ARGS__);
#else
#define NSLog(fmt, ...)
#endif

#endif /* DYHeader_h */

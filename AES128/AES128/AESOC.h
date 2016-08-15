//
//  AESOC.h
//  AES128
//
//  Created by yisanmao on 15/9/18.
//  Copyright (c) 2015年 zmw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AESOC : NSObject
/**
 *  产生8位16进制字符串
 *
 *  @return 16进制字符串
 */
+ (NSString *)createRand;
/**
 *  加密
 *
 *  @param key   加密key
 *  @param value 加密值
 *
 *  @return 加密之后的值
 */
+ (NSString *)encrypt:(NSString *)key value:(NSString *)value;
/**
 *  解密
 *
 *  @param key   加密key
 *  @param value 加密产生的数据
 *
 *  @return 加密前的数据
 */
+ (NSString *)decrypt:(NSString *)key value:(NSString *)value;
@end

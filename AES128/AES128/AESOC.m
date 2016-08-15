//
//  AESOC.m
//  AES128
//
//  Created by yisanmao on 15/9/18.
//  Copyright (c) 2015年 zmw. All rights reserved.
//

#import "AESOC.h"
#import "aes.h"

@implementation AESOC
+ (NSString *)encrypt:(NSString *)key value:(NSString *)value
{
    uint8_t cKey[16], cValue[16], buffer[16];
    
    [AESOC convertString:key bytes:cKey];
    [AESOC convertString:value bytes:cValue];
    
    [AESOC phex:cKey];
    [AESOC phex:cValue];
    
    AES128_ECB_encrypt(cValue, cKey, buffer);
    [AESOC phex:buffer];
    return [AESOC convertBytes:buffer];
    
}

+ (NSString *)decrypt:(NSString *)key value:(NSString *)value
{
    uint8_t cKey[16], cValue[16], buffer[16];
    
    [AESOC convertString:key bytes:cKey];
    [AESOC convertString:value bytes:cValue];
    [AESOC phex:cKey];
    [AESOC phex:cValue];
    AES128_ECB_decrypt(cValue, cKey, buffer);
    
    [AESOC phex:buffer];
    return [AESOC convertBytes:buffer];
}

//将十进制转化为十六进制
+ (NSString *)ToHex:(uint16_t)tmpid
{
    NSString *nLetterValue;
    NSString *str =@"";
    uint16_t ttmpig;
    for (int i = 0; i<9; i++) {
        ttmpig=tmpid%16;
        tmpid=tmpid/16;
        switch (ttmpig)
        {
            case 10:
                nLetterValue =@"a";break;
            case 11:
                nLetterValue =@"b";break;
            case 12:
                nLetterValue =@"c";break;
            case 13:
                nLetterValue =@"d";break;
            case 14:
                nLetterValue =@"e";break;
            case 15:
                nLetterValue =@"f";break;
            default:
                nLetterValue = [NSString stringWithFormat:@"%u",ttmpig];
                
        }
        str = [nLetterValue stringByAppendingString:str];
        if (tmpid == 0) {
            break;
        }
        
    }
    if (str.length == 1)
    {
        str = [NSString stringWithFormat:@"0%@", str];
    }
    return str;
}

+ (NSString *)createRand
{
    NSMutableString *strs = [NSMutableString string];
    for (int i = 0; i < 16; i++)
    {
        int rand = arc4random()%0xff;
        NSString *str = [AESOC ToHex:rand];
        [strs appendString:str];
    }
    
    return strs;
}

+ (void)convertString:(NSString *)value bytes:(uint8_t [16])bytes
{
    int j = 0;
    int i;
    for (i=0; i < value.length / 2; i++)
    {
        char byte_chars[3]= {'\0', '\0', '\0'};
        byte_chars[0] = [value characterAtIndex:i*2];
        byte_chars[1] = [value characterAtIndex:i*2+1];
        bytes[j] = strtol(byte_chars, NULL, 16);
        j++;
    }
}

+ (NSString *)convertBytes:(uint8_t[16])byte
{
    NSMutableString * hexString = [[NSMutableString alloc] init];
    
    for(NSUInteger i = 0; i < 16; i++ )
        [hexString appendString:[NSString stringWithFormat:@"%0.2x", byte[i]]];
    
    return hexString;
}

// prints string as hex
+ (void)phex:(uint8_t*)str
{
    unsigned char i;
    for(i = 0; i < 16; ++i)
        printf("%.2x", str[i]);
    printf("\n");
}

@end

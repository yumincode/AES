//
//  ViewController.m
//  AES加密
//
//  Created by 虞敏 on 16/3/16.
//  Copyright © 2016年 YM. All rights reserved.
//

#import "ViewController.h"
#import "NSData+Extension.h"
static NSString *sureString = @"CodingMan";
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *afterEnCoding=[self enCodingString:@"hello,My name is yumin"];
    NSString *deCodingString = [self deCodingString:afterEnCoding];
    NSLog(@"afterEnCoding  = %@",afterEnCoding);
    NSLog(@"deCodingString = %@",deCodingString);
}
- (NSString *)enCodingString:(NSString *)string{
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    NSData *enCodingData=[data aes256_encrypt:sureString];
    NSString *returnString = [enCodingData base64EncodedString];
    return returnString;
}
- (NSString *)deCodingString:(NSString *)string{
    NSData *decodeData = [string base64DecodedData];
    NSData *afterDecodeData = [decodeData aes256_decrypt:sureString];
    NSString *deCodeString = [[NSString alloc]initWithData:afterDecodeData encoding:NSUTF8StringEncoding];
    return deCodeString;
}

@end

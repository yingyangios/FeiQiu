//
//  ToolUtil.m
//  FeiQiu
//
//  Created by zhaoyan on 12/29/15.
//  Copyright © 2015 ZY. All rights reserved.
//

#import "ToolUtil.h"

@implementation ToolUtil

+(NSString *)getImageFilePath:(NSString *)file
{
    NSString * path = @"";
    path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    
    return [path stringByAppendingPathComponent:file];
}

@end

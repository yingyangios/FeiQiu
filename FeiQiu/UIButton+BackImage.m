//
//  UIButton+BackImage.m
//  FeiQiu
//
//  Created by zhaoyan on 12/29/15.
//  Copyright © 2015 ZY. All rights reserved.
//

#import "UIButton+BackImage.h"

@implementation UIButton (BackImage)

-(void)setBackgroundImageWithFilePath:(NSString *)path isLocal:(BOOL)isLocal forState:(UIControlState)state
{
    if (isLocal)
    {
        UIImage * image = [[UIImage alloc]initWithContentsOfFile:path];
        [self setBackgroundImage:image forState:state];
    }
}

@end

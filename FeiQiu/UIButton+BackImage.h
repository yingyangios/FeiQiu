//
//  UIButton+BackImage.h
//  FeiQiu
//
//  Created by zhaoyan on 12/29/15.
//  Copyright © 2015 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (BackImage)

-(void)setBackgroundImageWithFilePath:(NSString *)path isLocal:(BOOL)isLocal forState:(UIControlState)state;

@end

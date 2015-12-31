//
//  UIView+Frame.m
//  FeiQiu
//
//  Created by zhaoyan on 12/31/15.
//  Copyright © 2015 ZY. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

/**
 Get & Set frame.origin.x
 
 */
-(void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

-(CGFloat)x
{
    return self.frame.origin.x;
}

/**
 Get & Set Frame.origin.y
 
 */
-(void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

-(CGFloat)y
{
    return self.frame.origin.y;
}

/**
 Get & Set Frame.size.height
 
 */
-(void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

-(CGFloat)height
{
    return self.frame.size.height;
}

/**
 Get & Set Frame.size.width
 
 */
-(void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

-(CGFloat)width
{
    return self.frame.size.width;
}
@end

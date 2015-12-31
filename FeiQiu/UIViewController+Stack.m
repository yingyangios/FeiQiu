
//
//  Stack.m
//  FeiQiu
//
//  Created by zhaoyan on 12/31/15.
//  Copyright © 2015 ZY. All rights reserved.
//

#import "UIViewController+Stack.h"
#import "FlipViewControllers.h"
#import "AppDelegate.h"
@implementation UIViewController (Stack)


-(void)pushToStack
{
    FlipViewControllers * flipVC =(FlipViewControllers *) ([(AppDelegate *)([UIApplication sharedApplication].delegate) window].rootViewController);
    [flipVC pushViewController:self];
}

-(void)popFromStack
{
    
}

@end

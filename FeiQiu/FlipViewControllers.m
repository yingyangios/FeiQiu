//
//  FlipViewControllers.m
//  FeiQiu
//
//  Created by zhaoyan on 12/30/15.
//  Copyright © 2015 ZY. All rights reserved.
//

#import "FlipViewControllers.h"

@interface FlipViewControllers ()

@property (nonatomic , assign)BOOL isRootViewVisible;
@property (nonatomic , weak) UIView * visibleView;
@property (nonatomic , weak) UIView * contentView;

@end

@implementation FlipViewControllers

-(instancetype)initWithRootViewController:(UIViewController *)rootViewController
{
    if (self = [super init])
    {
        self.viewcontrollers = [NSMutableArray arrayWithObjects:rootViewController, nil];
        self.isRootViewVisible = YES;
    }
    return self;
}

-(void)loadView
{
    [super loadView];
    UIView * contentView = [[UIView alloc]initWithFrame:[self childVCFrame]];
    _contentView = contentView;
    _contentView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_contentView];
    
    UIViewController * rootViewController = [_viewcontrollers objectAtIndex:0];
    self.visibleView = rootViewController.view;
    [rootViewController willMoveToParentViewController:self];
    [self addChildViewController:rootViewController];
    
    self.visibleView.frame = _contentView.bounds;
    self.visibleView.clipsToBounds = YES;
    self.visibleView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [_contentView addSubview:self.visibleView];
    
    [rootViewController didMoveToParentViewController:self];
    
    
}

#pragma mark - viewController push or pop
-(void)pushViewController:(UIViewController *)pushVC
{
    /**
     这个push的概念只是把 新来的viewcontroller.view 添加到contentView中。原来的view 根本没有人进行管理
     也就导致了原来的controller中的 disappear（did，will）没有被调用
     */
    [_viewcontrollers addObject:pushVC];
    
    [pushVC willMoveToParentViewController:self];
    [self addChildViewController:pushVC];
    
    UIView * pushView = pushVC.view; // 这句话的时候。程序开始执行 viewdidload
    pushView.frame = CGRectOffset(_contentView.bounds, _contentView.frame.size.width, 0);
    NSLog(@" previous :frame %@",NSStringFromCGRect(pushView.frame));
    pushView.clipsToBounds = YES;
    pushView.autoresizesSubviews = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;

    [_contentView addSubview:pushView];
    
    
    [UIView animateWithDuration:0.25 animations:^{
        CGAffineTransform trans = CGAffineTransformIdentity;
        self.visibleView.transform = CGAffineTransformScale(trans, 0.9f, 0.9f);
        pushView.frame = _contentView.bounds;
        [self.visibleView removeFromSuperview];
        self.visibleView = pushView;
    } completion:^(BOOL finished) {
        [pushVC didMoveToParentViewController:self];
    }];
    
    
    
}

-(void)popViewController:(UIViewController *)popVC
{
    
}

#pragma mark - private 

-(CGRect)childVCFrame
{
    CGRect childVCFrame = self.view.bounds;
    if ([[UIDevice currentDevice].systemVersion floatValue] >7.0)
    {
        childVCFrame.origin.y += 20;
        childVCFrame.size.height -= 20;
    }
    
    return childVCFrame;
}

@end

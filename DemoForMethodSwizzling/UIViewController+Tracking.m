//
//  UIViewController+Tracking.m
//  DemoForMethodSwizzling
//
//  Created by wangjw on 16/9/26.
//  Copyright © 2016年 kaolafm. All rights reserved.
//

#import "UIViewController+Tracking.h"
#import <objc/runtime.h>

@implementation UIViewController (Tracking)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originSelector = @selector(viewWillAppear:);
        SEL swizzlingSelector = @selector(xxx_viewWillAppear:);
        
        Method originMethod = class_getInstanceMethod(class, originSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzlingSelector);
        
        method_exchangeImplementations(originMethod, swizzledMethod);
    });
}

- (void)xxx_viewWillAppear:(BOOL)animated{
    [self xxx_viewWillAppear:animated];
    NSLog(@"viewWillAppear:%@",self);
}

@end

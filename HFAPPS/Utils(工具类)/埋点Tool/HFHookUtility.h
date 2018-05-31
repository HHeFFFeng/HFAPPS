//
//  HFHookUtility.h
//  HFAPPS
//
//  Created by hefeng on 2018/4/26.
//  Copyright © 2018年 hefeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HFHookUtility : NSObject

+ (void)swizzlingInClass:(Class)cls originalSelector:(SEL)originalSelector swizzledSelector:(SEL)swizzledSelector;

@end

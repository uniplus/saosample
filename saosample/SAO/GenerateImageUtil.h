//
//  GenerateImageUtil.h
//  saosample
//
//  Created by 秋山 高弘 on 2014/02/06.
//  Copyright (c) 2014年 Silver Frontier. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GenerateImageUtil : NSObject

+(UIImage*)imageWithColor:(UIColor*)color rect:(CGRect)rect;
+(UIImage*)imageWithColor:(UIColor *)color rect:(CGRect)rect cornerRadius:(float)cornerRadius;
+(UIImage*)imageForUPArrow:(UIColor*)color rect:(CGRect)rect;
+(UIImage*)imageForDOWNArrow:(UIColor*)color rect:(CGRect)rect;
+(UIImage*)imageForRightArrow:(UIColor*)color rect:(CGRect)rect;
+(UIImage*)imageForLeftArrow:(UIColor*)color rect:(CGRect)rect;
+(UIImage*)imageForRightArrowHead:(UIColor*)color rect:(CGRect)rect lineWidth:(CGFloat)lineWidth;
+(UIImage*)imageForLeftArrowHead:(UIColor*)color rect:(CGRect)rect lineWidth:(CGFloat)lineWidth;
+(UIImage*)imageForCircle:(UIColor*)color rect:(CGRect)rect;

@end

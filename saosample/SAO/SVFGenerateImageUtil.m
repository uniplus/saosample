//
//  SVFGenerateImageUtil.m
//  simplefigure
//
//  Created by 秋山 高弘 on 2014/02/06.
//  Copyright (c) 2014年 Silver Frontier. All rights reserved.
//

#import "SVFGenerateImageUtil.h"

@implementation SVFGenerateImageUtil

+ (UIImage *)imageWithColor:(UIColor *)color rect:(CGRect)rect cornerRadius:(float)cornerRadius
{
    UIImage* image = [SVFGenerateImageUtil imageWithColor:color rect:rect];
    CALayer *imageLayer = [CALayer layer];
    imageLayer.frame            = rect;
    imageLayer.contents         = (id) image.CGImage;
    imageLayer.masksToBounds    = YES;
    imageLayer.cornerRadius     = cornerRadius;
    
    if (UIGraphicsBeginImageContextWithOptions != NULL) {
        UIGraphicsBeginImageContextWithOptions(rect.size, NO, [UIScreen mainScreen].scale);
    } else {
        UIGraphicsBeginImageContext(rect.size);
    }
    [imageLayer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *roundedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return roundedImage;
}

+ (UIImage *)imageWithColor:(UIColor *)color rect:(CGRect)rect
{
    if (UIGraphicsBeginImageContextWithOptions != NULL) {
        UIGraphicsBeginImageContextWithOptions(rect.size, NO, [UIScreen mainScreen].scale);
    } else {
        UIGraphicsBeginImageContext(rect.size);
    }
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+(UIImage*)imageForUPArrow:(UIColor*)color rect:(CGRect)rect
{
    if (UIGraphicsBeginImageContextWithOptions != NULL) {
        UIGraphicsBeginImageContextWithOptions(rect.size, NO, [UIScreen mainScreen].scale);
    } else {
        UIGraphicsBeginImageContext(rect.size);
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    
    float width     = rect.size.width;
    float height    = rect.size.height;
    
    CGContextMoveToPoint    (context, width * 0.5, 0);
    CGContextAddLineToPoint (context, width, height);
    CGContextAddLineToPoint (context, 0, height);
    CGContextFillPath       (context);//塗りつぶす
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+(UIImage*)imageForDOWNArrow:(UIColor*)color rect:(CGRect)rect
{
    if (UIGraphicsBeginImageContextWithOptions != NULL) {
        UIGraphicsBeginImageContextWithOptions(rect.size, NO, [UIScreen mainScreen].scale);
    } else {
        UIGraphicsBeginImageContext(rect.size);
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    
    float width     = rect.size.width;
    float height    = rect.size.height;
    
    CGContextMoveToPoint    (context, width * 0.5, height);
    CGContextAddLineToPoint (context, width, 0);
    CGContextAddLineToPoint (context, 0, 0);
    CGContextFillPath       (context);//塗りつぶす
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+(UIImage*)imageForRightArrow:(UIColor*)color rect:(CGRect)rect
{
    if (UIGraphicsBeginImageContextWithOptions != NULL) {
        UIGraphicsBeginImageContextWithOptions(rect.size, NO, [UIScreen mainScreen].scale);
    } else {
        UIGraphicsBeginImageContext(rect.size);
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    
    float width     = rect.size.width;
    float height    = rect.size.height;
    
    CGContextMoveToPoint    (context, 0, 0);
    CGContextAddLineToPoint (context, width, height * 0.5f);
    CGContextAddLineToPoint (context, 0, height);
    CGContextFillPath       (context);//塗りつぶす
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+(UIImage*)imageForRightArrowHead:(UIColor*)color rect:(CGRect)rect lineWidth:(CGFloat)lineWidth
{
    if (UIGraphicsBeginImageContextWithOptions != NULL) {
        UIGraphicsBeginImageContextWithOptions(rect.size, NO, [UIScreen mainScreen].scale);
    } else {
        UIGraphicsBeginImageContext(rect.size);
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor  (context, [color CGColor]);
    CGContextSetStrokeColorWithColor(context, [color CGColor]);
    
    CGContextSetLineWidth           (context, lineWidth);
    CGContextSetLineCap             (context, kCGLineCapRound);
    
    float width     = rect.size.width;
    float height    = rect.size.height;
    
    CGContextMoveToPoint    (context, lineWidth*0.5, lineWidth*0.5);
    CGContextAddLineToPoint (context, width-lineWidth, height * 0.5f);
    CGContextAddLineToPoint (context, lineWidth*0.5, height-lineWidth);
    CGContextStrokePath(context);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+(UIImage*)imageForLeftArrowHead:(UIColor*)color rect:(CGRect)rect lineWidth:(CGFloat)lineWidth
{
    if (UIGraphicsBeginImageContextWithOptions != NULL) {
        UIGraphicsBeginImageContextWithOptions(rect.size, NO, [UIScreen mainScreen].scale);
    } else {
        UIGraphicsBeginImageContext(rect.size);
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor  (context, [color CGColor]);
    CGContextSetStrokeColorWithColor(context, [color CGColor]);
    
    CGContextSetLineWidth           (context, lineWidth);
    CGContextSetLineCap             (context, kCGLineCapRound);
    
    float width     = rect.size.width;
    float height    = rect.size.height;
    
    CGContextMoveToPoint    (context, width-lineWidth*0.5, lineWidth*0.5);
    CGContextAddLineToPoint (context, lineWidth*0.5, height * 0.5f);
    CGContextAddLineToPoint (context, width-lineWidth*0.5, height-lineWidth);
    CGContextStrokePath(context);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+(UIImage*)imageForLeftArrow:(UIColor*)color rect:(CGRect)rect
{
    if (UIGraphicsBeginImageContextWithOptions != NULL) {
        UIGraphicsBeginImageContextWithOptions(rect.size, NO, [UIScreen mainScreen].scale);
    } else {
        UIGraphicsBeginImageContext(rect.size);
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    
    float width     = rect.size.width;
    float height    = rect.size.height;
    
    CGContextMoveToPoint    (context, width, 0);
    CGContextAddLineToPoint (context, 0, height * 0.5f);
    CGContextAddLineToPoint (context, width, height);
    CGContextFillPath       (context);//塗りつぶす
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+(UIImage*)imageForCircle:(UIColor*)color rect:(CGRect)rect
{
    if (UIGraphicsBeginImageContextWithOptions != NULL) {
        UIGraphicsBeginImageContextWithOptions(rect.size, NO, [UIScreen mainScreen].scale);
    } else {
        UIGraphicsBeginImageContext(rect.size);
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //描画の中心点
    float cx = rect.size.width  * 0.5f;
    float cy = rect.size.height * 0.5f;
    
    //円の半径
    float R = cx - 2;
    
    //円の範囲
    CGRect rectEllipse = CGRectMake(cx - R, cy - R, R*2, R*2);
    
    // Drawing code
    // 円を描画
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextSetRGBStrokeColor(context, 1.0, 1.0, 1.0, 1.0);
    CGContextSetLineWidth(context, 2.0);
    
    CGContextFillEllipseInRect(context, rectEllipse);
    //CGContextAddEllipseInRect(context,  rect);
    
    
    //    //円の中身を描画
    //    CGContextSetFillColorWithColor(context, color.CGColor);
    //    CGContextFillEllipseInRect(context, rectEllipse);
    
    //    //内側の線を描画
    //    //円の線を描画
    //    {
    //        //円の範囲
    //        CGRect rectEllipse = CGRectMake(cx - R, cy - R, R*2, R*2);
    //        CGContextSetStrokeColorWithColor(context, color.CGColor);
    //        CGContextSetLineWidth       (context, 1.0);
    //        CGContextStrokeEllipseInRect(context, rectEllipse);
    //    }
    //
    //    CGContextDrawPath(context, kCGPathFillStroke);//描く
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end

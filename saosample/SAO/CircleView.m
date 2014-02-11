//
//  CircleView.m
//  animechu
//
//  Created by 秋山 高弘 on 13/03/13.
//  Copyright (c) 2013年 秋山 高弘. All rights reserved.
//

#import "CircleView.h"

@implementation CircleView

//-(void)dealloc
//{
//    [_circleColor release],_circleColor=nil;
//    [_keyStr release],_keyStr=nil;
//    [_icon release],_icon=nil;
//    
//    [super dealloc];
//}

- (id)initWithFrame:(CGRect)frame color:(UIColor*)color forKey:(NSString *)key
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _circleColor    = color;
        _keyStr         = key;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame color:(UIColor*)color icon:(UIImage*)icon forKey:(NSString *)key
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _icon           = icon;
        _circleColor    = color;
        _keyStr         = key;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame color:(UIColor*)color title:(NSString*)title forKey:(NSString *)key
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _title          = title;
        _circleColor    = color;
        _keyStr         = key;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();  // コンテキストを取得
    
    UIColor* bgColor=nil;
    UIColor* textColor=nil;
    if (_selected) {
        bgColor     = _selectedCircleColor;
        textColor   = [UIColor whiteColor];
    } else {
        bgColor     = _circleColor;
        textColor   = [UIColor grayColor];
    }
    
    //CGContextAddEllipseInRect(context,  rect);
    
    
    //描画の中心点
    float cx = self.bounds.size.width  * 0.5f;
    float cy = self.bounds.size.height * 0.5f;
    
    //円の半径
    float R = cx - 2;
    
    //円の範囲
    CGRect rectEllipse = CGRectMake(cx - R, cy - R, R * 2,  R * 2);
    
    // Drawing code
    // 円を描画
    CGContextSetFillColorWithColor(context, bgColor.CGColor);
    CGContextSetRGBStrokeColor(context, 1.0, 1.0, 1.0, 1.0);
    CGContextSetLineWidth(context, 1.0);
    
    //円の範囲
    CGContextFillEllipseInRect(context, rectEllipse);
    
    
    //円の線を描画
    CGContextSetRGBStrokeColor(context, 1.0, 1.0, 1.0, 1.0);
    CGContextSetLineWidth(context, 1.0);
    
    //内側の線を描画
    {
        //円の範囲
        R -= 2;
        CGRect rectEllipse = CGRectMake(cx - R, cy - R, R*2, R*2);
        CGContextSetRGBStrokeColor  (context, 1.0, 1.0, 1.0, 1.0);
        CGContextSetLineWidth       (context, 1.0);
        CGContextStrokeEllipseInRect(context, rectEllipse);
    }

    {   //icon を描画
        if (_icon) {
            NSLog(@"_icon[%@]",NSStringFromCGSize(_icon.size));
            CGRect iconRect = self.bounds;
            iconRect.origin.x   = (iconRect.size.width-_icon.size.width)*0.5f;
            iconRect.origin.y   = (iconRect.size.height-_icon.size.height)*0.5f;
            iconRect.size.width  = _icon.size.width;
            iconRect.size.height = _icon.size.height;
            CGContextScaleCTM(context, 1, -1);
            CGContextTranslateCTM(context, 0, -self.frame.size.height );
            CGContextDrawImage(context, iconRect, _icon.CGImage);
        }
    }
    {
        if (_title) {
            // テキストの描画日本語が化ける
            CGContextSetTextDrawingMode (context,kCGTextFillStroke);
            CGAffineTransform affine = CGAffineTransformMake(1.0, 0.0, 0.0, -1.0, 0.0, 0.0);
            CGContextSetTextMatrix  (context, affine);
            
            UIFont *font    = [UIFont fontWithName:@"HiraKakuProN-W3" size:10.0];
            
            NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:_title ];
            
            [attrStr addAttribute:NSKernAttributeName
                            value:([_title length]>=3?@1.0:@2.0)
                            range:NSMakeRange(0, attrStr.length)];
            
            [attrStr addAttribute:NSFontAttributeName
                            value:font
                            range:NSMakeRange(0, attrStr.length)];
            
            [attrStr addAttribute:NSForegroundColorAttributeName
                            value:textColor
                            range:NSMakeRange(0, attrStr.length)];
            
            CGSize size = [attrStr size];
            if ([UIScreen mainScreen].scale==2.0) {
                [attrStr drawInRect:CGRectMake(floorf((rect.size.width - size.width)*0.5 + ([_title length]>=3?1:1)), floorf((rect.size.height - size.height)*0.5), size.width, size.height)];
            } else {
                [attrStr drawInRect:CGRectMake(floorf((rect.size.width - size.width)*0.5 + ([_title length]>=3?1:2)), floorf((rect.size.height - size.height)*0.5), size.width, size.height)];
            }
        }
    }
}

@end

//
//  CircleView.h
//  saosample
//
//  Created by 秋山 高弘 on 2014/02/06.
//  Copyright (c) 2014年 Silver Frontier. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SVFCircleView : UIView
{
    UIColor* _circleColor;
    UIImage* _icon;
    NSString* _title;
    NSString* _keyStr;
    
    UILabel*        _titleLabel;
    UIImageView*    _iconImageView;
}

@property (nonatomic ,strong)UIColor*  circleColor;
@property (nonatomic ,strong)UIColor*  selectedCircleColor;
@property (nonatomic ,strong)UIImage*  icon;
@property (nonatomic ,strong)NSString* title;
@property (nonatomic ,strong)NSString* keyStr;
@property (nonatomic ,assign)BOOL selected;

- (id)initWithFrame:(CGRect)frame color:(UIColor*)color forKey:(NSString*)key;
- (id)initWithFrame:(CGRect)frame color:(UIColor*)color title:(NSString*)title forKey:(NSString*)key;
- (id)initWithFrame:(CGRect)frame color:(UIColor*)color icon:(UIImage*)icon forKey:(NSString*)key;

@end

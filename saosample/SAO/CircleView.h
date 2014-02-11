//
//  CircleView.h
//  animechu
//
//  Created by 秋山 高弘 on 13/03/13.
//  Copyright (c) 2013年 秋山 高弘. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleView : UIView
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

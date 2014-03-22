//
//  SVFGenerateImageUtil.h
//  simplefigure
//
//  Created by 秋山 高弘 on 2014/02/06.
//  Copyright (c) 2014年 Silver Frontier. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 * GenerateImageUtil
 * @discussion 簡単図形を生成するユーティリティクラス
 *
 */
@interface SVFGenerateImageUtil : NSObject

/*!
 * 指定した色と矩形で四角形のUIImageを生成
 *
 * @param color 色
 * @param rect 矩形
 * @return UImage 四角形
 *
 */
+(UIImage*)imageWithColor:(UIColor*)color rect:(CGRect)rect;

/*!
 * 指定した色と矩形と角度で角丸四角形のUIImageを生成
 *
 * @param color 色
 * @param rect 矩形
 * @param cornerRadius 角の丸半径
 * @return UImage 角丸四角形
 *
 */
+(UIImage*)imageWithColor:(UIColor *)color rect:(CGRect)rect cornerRadius:(float)cornerRadius;

/*!
 * 指定した色で矩形に収まる上向き矢尻（三角形）のUIImageを生成
 *
 * @param color 色
 * @param rect 矩形
 * @return UImage 上向き矢尻（三角形）
 *
 */
+(UIImage*)imageForUPArrow:(UIColor*)color rect:(CGRect)rect;

/*!
 * 指定した色で矩形に収まる下向き矢尻（三角形）のUIImageを生成
 *
 * @param color 色
 * @param rect 矩形
 * @return UImage 上向き矢尻（三角形）
 *
 */
+(UIImage*)imageForDOWNArrow:(UIColor*)color rect:(CGRect)rect;

/*!
 * 指定した色で矩形に収まる右向き矢尻（三角形）のUIImageを生成
 *
 * @param color 色
 * @param rect 矩形
 * @return UImage 右向き矢尻（三角形）
 *
 */
+(UIImage*)imageForRightArrow:(UIColor*)color rect:(CGRect)rect;

/*!
 * 指定した色で矩形に収まる左向き矢尻（三角形）のUIImageを生成
 *
 * @param color 色
 * @param rect 矩形
 * @return UImage 左向き矢尻（三角形）
 *
 */
+(UIImage*)imageForLeftArrow:(UIColor*)color rect:(CGRect)rect;

/*!
 * 指定した色で矩形に収まる右向き矢尻（＞）のUIImageを生成
 *
 * @param color 色
 * @param rect 矩形
 * @param lineWidth 線の太さ
 * @return UImage 右向き矢尻（＞）
 *
 */
+(UIImage*)imageForRightArrowHead:(UIColor*)color rect:(CGRect)rect lineWidth:(CGFloat)lineWidth;

/*!
 * 指定した色で矩形に収まる左向き矢尻（＜）のUIImageを生成。
 *
 * @param color 色
 * @param rect 矩形
 * @param lineWidth 線の太さ
 * @return UImage 左向き矢尻（＜）
 *
 */
+(UIImage*)imageForLeftArrowHead:(UIColor*)color rect:(CGRect)rect lineWidth:(CGFloat)lineWidth;

/*!
 * 指定した色で矩形に収まる円形のUIImageを生成
 *
 * @param pageIndex ページ番号
 * @return 遷移できない番号を指定した場合NO
 *
 */
+(UIImage*)imageForCircle:(UIColor*)color rect:(CGRect)rect;

@end

//
//  FilterBase.h
//  ColoringOnPicture
//
//  Created by Hidekazu TANAKA on 2016/07/04.
//  Copyright © 2016年 Excelsum Lab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <opencv2/opencv.hpp>

@interface FilterBase : NSObject

/*!
 @method
 @abstract フィルタ処理を実行するメソッド
 @discussion 引数imageにフィルタ処理したCGImageを返す。
 @param image CGImageRef フィルタ処理をかけるCGImage
 @return CGImageRef フィルタ処理したCGImage
 */
- (CGImageRef)doFilter:(CGImageRef)image;

/*!
 @method
 @abstract CGImageをOpenCV画像データに変換するメソッド
 @param image CGImageRef CGImage
 @return IplImage OpenCV画像データ
 */
- (IplImage *)newIplImageFromCGImage:(CGImageRef)image;

/*!
 @method
 @abstract OpenCV画像データをCGImageに変換するメソッド
 @param image IplImage OpenCV画像データ
 @return CGImageRef CGImage
 */
- (CGImageRef)newCGImageFromIplImage:(IplImage *)image;

@end
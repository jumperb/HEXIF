//
//  HE_Exif_.h
//  HEXIF
//
//  Created by zhangchutian on 16/2/26.
//  Copyright © 2016年 zhangchutian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HEXIFNode.h"
@interface HE_Exif_ : HEXIFNode
@property (nonatomic) double ApertureValue;
@property (nonatomic) double BrightnessValue;
@property (nonatomic) int ColorSpace;
//inside type is NSNumber(int)
@property (nonatomic) NSArray<NSNumber *> *ComponentsConfiguration;
@property (nonatomic) NSString *DateTimeDigitized;
@property (nonatomic) NSString *DateTimeOriginal;
//inside type is NSNumber(int)
@property (nonatomic) NSArray<NSNumber *> *ExifVersion;
@property (nonatomic) double ExposureBiasValue;
@property (nonatomic) int ExposureMode;
@property (nonatomic) int ExposureProgram;
@property (nonatomic) double ExposureTime;
@property (nonatomic) double FNumber;
@property (nonatomic) int Flash;
//inside type is NSNumber(int)
@property (nonatomic) NSArray<NSNumber *> *FlashPixVersion;
@property (nonatomic) int FocalLenIn35mmFilm;
@property (nonatomic) double FocalLength;
//inside type is NSNumber(int)
@property (nonatomic) NSArray<NSNumber *> *ISOSpeedRatings;
@property (nonatomic) NSString *LensMake;
@property (nonatomic) NSString *LensModel;
//inside type is NSNumber(float)
@property (nonatomic) NSArray<NSNumber *> *LensSpecification;
@property (nonatomic) int MeteringMode;
@property (nonatomic) int PixelXDimension;
@property (nonatomic) int PixelYDimension;
@property (nonatomic) int SceneCaptureType;
@property (nonatomic) int SceneType;
@property (nonatomic) int SensingMethod;
@property (nonatomic) double ShutterSpeedValue;
//inside type is NSNumber(int)
@property (nonatomic) NSArray<NSNumber *> *SubjectArea;
@property (nonatomic) NSString *SubsecTimeDigitized;
@property (nonatomic) NSString *SubsecTimeOriginal;
@property (nonatomic) int WhiteBalance;
@end

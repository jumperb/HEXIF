//
//  HEXIF.h
//  HEXIF
//
//  Created by zhangchutian on 16/2/24.
//  Copyright © 2016年 zhangchutian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HEXIFNode.h"
#import "HE_Exif_.h"
#import "HE_TIFF_.h"
#import "HE_GPS_.h"
#import "HE_ExifAux_.h"
#import "HE_IPTC_.h"
#import "HE_JFIF_.h"

@interface HEXIF : HEXIFNode
@property (nonatomic) NSString *ColorModel;
@property (nonatomic) float DPIHeight;
@property (nonatomic) float DPIWidth;
@property (nonatomic) int Depth;
@property (nonatomic) int Orientation;
@property (nonatomic) int PixelHeight;
@property (nonatomic) int PixelWidth;
@property (nonatomic) NSString *ProfileName;
//apple make info, usually we don't care about it
@property (nonatomic) NSDictionary *_MakerApple_;
@property (nonatomic) HE_Exif_ *_Exif_;
@property (nonatomic) HE_ExifAux_ *_ExifAux_;
@property (nonatomic) HE_GPS_ *_GPS_;
@property (nonatomic) HE_TIFF_ *_TIFF_;
@property (nonatomic) HE_IPTC_ *_IPTC_;
@property (nonatomic) HE_JFIF_ *_JFIF_;
+ (instancetype)hExifWithImageData:(NSData *)imageData;
+ (instancetype)hExifWithDictionary:(NSDictionary *)dict;
//输出字典
- (NSDictionary *)outputDictionary;
@end

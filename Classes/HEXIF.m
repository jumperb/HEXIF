//
//  HEXIF.m
//  HEXIF
//
//  Created by zhangchutian on 16/2/24.
//  Copyright © 2016年 zhangchutian. All rights reserved.
//

#import "HEXIF.h"

@implementation HEXIF
ppx(ColorModel, HPOptional)
ppx(DPIHeight, HPOptional)
ppx(DPIWidth, HPOptional)
ppx(Depth, HPOptional)
ppx(Orientation, HPOptional)
ppx(PixelHeight, HPOptional)
ppx(PixelWidth, HPOptional)
ppx(ProfileName, HPOptional)
ppx(_MakerApple_, HPMapto(@"{MakerApple}"), HPOptional)
ppx(_Exif_, HPMapto(@"{Exif}"), HPOptional)
ppx(_ExifAux_, HPMapto(@"{ExifAux}"), HPOptional)
ppx(_GPS_, HPMapto(@"{GPS}"), HPOptional)
ppx(_TIFF_, HPMapto(@"{TIFF}"), HPOptional)
ppx(_IPTC_, HPMapto(@"{IPTC}"), HPOptional)
ppx(_JFIF_, HPMapto(@"{JFIF}"), HPOptional)

+ (instancetype)hExifWithImageData:(NSData *)imageData
{
    return [[HEXIF alloc] initWithImageData:imageData];
}
- (instancetype)initWithImageData:(NSData *)imageData
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

+ (instancetype)hExifWithDictionary:(NSDictionary *)dict
{
    return [[HEXIF alloc] initWithDictionary:dict];
}
- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self setWithDictionary:dict];
        NSAssert(self.format_error == nil, ([NSString stringWithFormat:@"%@:%@", NSStringFromClass(self.class),self.format_error]));
        if (self.format_error)
        {
            NSLog(@"%@:%@", NSStringFromClass(self.class),self.format_error);
            return nil;
        }
    }
    return self;
}

- (NSDictionary *)outputDictionary
{
    return [self exif_serialization];
}

- (NSData *)outputToImageData:(NSData *)imageData
{
    return nil;
}

@end

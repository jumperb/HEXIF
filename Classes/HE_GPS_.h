//
//  HE_GPS_.h
//  HEXIF
//
//  Created by zhangchutian on 16/2/26.
//  Copyright © 2016年 zhangchutian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HEXIFNode.h"
@interface HE_GPS_ : HEXIFNode
@property (nonatomic) double Latitude;
@property (nonatomic) NSString *ImgDirectionRef;
@property (nonatomic) double DestBearing;
@property (nonatomic) double Longitude;
@property (nonatomic) int AltitudeRef;
@property (nonatomic) double ImgDirection;
@property (nonatomic) NSString *TimeStamp;
@property (nonatomic) double Speed;
@property (nonatomic) NSString *LatitudeRef;
@property (nonatomic) NSString *SpeedRef;
@property (nonatomic) NSString *DestBearingRef;
@property (nonatomic) double Altitude;
@property (nonatomic) NSString *LongitudeRef;
@property (nonatomic) NSString *DateStamp;
@property (nonatomic) double HPositioningError;
@end

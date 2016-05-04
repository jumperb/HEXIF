//
//  HERegionListItem.h
//  HEXIF
//
//  Created by zhangchutian on 16/2/26.
//  Copyright © 2016年 zhangchutian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HEXIFNode.h"

@interface HERegionListItem : HEXIFNode
@property (nonatomic) int AngleInfoRoll;
@property (nonatomic) int AngleInfoYaw;
@property (nonatomic) int ConfidenceLevel;
@property (nonatomic) int FaceID;
@property (nonatomic) double Height;
@property (nonatomic) int Timestamp;
@property (nonatomic) NSString *Type;
@property (nonatomic) double Width;
@property (nonatomic) double X;
@property (nonatomic) double Y;
@end

//
//  HE_JFIF_.h
//  HEXIF
//
//  Created by zhangchutian on 16/2/29.
//  Copyright © 2016年 zhangchutian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HEXIFNode.h"

@interface HE_JFIF_ : HEXIFNode
@property (nonatomic) long DensityUnit;
//inside type is NSNumber(long)
@property (nonatomic) NSArray<NSNumber *> *JFIFVersion;
@property (nonatomic) long XDensity;
@property (nonatomic) long YDensity;
@end

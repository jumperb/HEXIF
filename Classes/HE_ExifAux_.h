//
//  HE_ExifAux_.h
//  HEXIF
//
//  Created by zhangchutian on 16/2/26.
//  Copyright © 2016年 zhangchutian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HEXIFNode.h"
#import "HERegions.h"

@interface HE_ExifAux_ : HEXIFNode
@property (nonatomic) long ImageNumber;
@property (nonatomic) long LensID;
//inside type is NSNumber(short)
@property (nonatomic) NSArray<NSNumber *> *LensInfo;
@property (nonatomic) NSString *LensModel;
@property (nonatomic) NSString *SerialNumber;
@property (nonatomic) HERegions *Regions;
@end

//
//  HE_TIFF_.h
//  HEXIF
//
//  Created by zhangchutian on 16/2/26.
//  Copyright © 2016年 zhangchutian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HEXIFNode.h"
@interface HE_TIFF_ : HEXIFNode
@property (nonatomic) NSString *Artist;
@property (nonatomic) NSString *Copyright;
@property (nonatomic) NSString *Model;
@property (nonatomic) int ResolutionUnit;
@property (nonatomic) double YResolution;
@property (nonatomic) double XResolution;
@property (nonatomic) int Orientation;
@property (nonatomic) NSString *Software;
@property (nonatomic) NSString *DateTime;
@property (nonatomic) NSString *Make;
@end

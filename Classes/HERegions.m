//
//  HERegions.m
//  HEXIF
//
//  Created by zhangchutian on 16/2/26.
//  Copyright © 2016年 zhangchutian. All rights reserved.
//

#import "HERegions.h"
#import "HERegionListItem.h"

@implementation HERegions
ppx(HeightAppliedTo, HPOptional)
ppx(WidthAppliedTo, HPOptional)
ppx(RegionList, HPOptional, HPInnerType([HERegionListItem class]))
@end

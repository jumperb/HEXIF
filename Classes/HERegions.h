//
//  HERegions.h
//  HEXIF
//
//  Created by zhangchutian on 16/2/26.
//  Copyright © 2016年 zhangchutian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HEXIFNode.h"
#import "HERegionListItem.h"

@interface HERegions : HEXIFNode
@property (nonatomic) int HeightAppliedTo;
@property (nonatomic) int WidthAppliedTo;
@property (nonatomic) NSArray<HERegionListItem *> *RegionList;
@end

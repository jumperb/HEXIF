//
//  HE_IPTC_.h
//  HEXIF
//
//  Created by zhangchutian on 16/2/29.
//  Copyright © 2016年 zhangchutian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HEXIFNode.h"

@interface HE_IPTC_ : HEXIFNode
@property (nonatomic) NSArray<NSString *> *Byline;
@property (nonatomic) NSString *City;
@property (nonatomic) NSString *CopyrightNotice;
@property (nonatomic) NSString *DateCreated;
@property (nonatomic) NSString *DigitalCreationDate;
@property (nonatomic) NSString *DigitalCreationTime;
@property (nonatomic) NSString *ObjectName;
@property (nonatomic) NSString *TimeCreated;
@end

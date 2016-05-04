//
//  HEXIFNode.h
//  HEXIF
//
//  Created by zhangchutian on 16/2/29.
//  Copyright © 2016年 zhangchutian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <HDeserializableObject.h>

@interface HEXIFNode : HDeserializableObject
- (id)exif_serialization;
@end

//
//  HEXIFNode.m
//  HEXIF
//
//  Created by zhangchutian on 16/2/29.
//  Copyright © 2016年 zhangchutian. All rights reserved.
//

#import "HEXIFNode.h"
#import <objc/runtime.h>
#import <NSObject+ext.h>

@interface HEXIFNode ()
@property (nonatomic) NSMutableDictionary *tmp_KVStore;
@end

@implementation HEXIFNode

- (void)setWithDictionary:(NSDictionary *)dict enableKeyMap:(BOOL)enableKeyMap
{
    [super setWithDictionary:dict enableKeyMap:enableKeyMap];
    //if key is not define as property, store it to tmp_KVStore
    NSArray *pplist = [[HPropertyMgr shared] entityPropertyDetailList:NSStringFromClass(self.class) isDepSearch:YES];
    NSMutableSet *mappedKeys = [NSMutableSet new];
    for (HPropertyDetail *ppDetail in pplist)
    {
        NSString *mapedKey = ppDetail.name;
        NSArray *annotions = [[self class] annotations:ppDetail.name];
        for (id annotion in annotions)
        {
            if ([annotion isKindOfClass:[NSDictionary class]])
            {
                NSDictionary *dict = annotion;
                NSString *mapTo = dict[@"mapto"];
                if (mapTo)
                {
                    mapedKey = mapTo;
                    break;
                }
            }
        }
        [mappedKeys addObject:mapedKey];
    }
    
    if (!_tmp_KVStore) _tmp_KVStore = [NSMutableDictionary new];
    for (NSString *key in dict)
    {
        if (![mappedKeys containsObject:key])
        {
            [_tmp_KVStore setObject:dict[key] forKey:key];
        }
    }
    
}

- (id)exif_serialization
{
    if([HEXIFNode exif_isSerializationObject:self]) return self;
    NSArray *properties = [NSObject depPPListOfClass:self.class];
    if (properties.count)
    {
        NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
        for (NSString *pp in properties)
        {
            id value = [self valueForKey:pp];
            if (value && value != [NSNull null])
            {
                if ([pp isEqualToString:@"tmp_KVStore"])
                {
                    [dict addEntriesFromDictionary:self.tmp_KVStore];
                }
                else
                {
                    if([HEXIFNode exif_isSerializationObject:value])
                    {
                        [dict setValue:value forKey:[self keyOfPropertyName:pp]];
                    }
                    else if ([value isKindOfClass:[HEXIFNode class]])
                    {
                        [dict setValue:[value exif_serialization] forKey:[self keyOfPropertyName:pp]];
                    }
                    else
                    {
                        NSAssert(NO, @"unsupport type");
                    }
                }
            }
        }
        return dict;
    }
    else return NSStringFromClass([self class]);
}
- (NSString *)keyOfPropertyName:(NSString *)pp
{
    NSString *key = pp;
    if ([key hasPrefix:@"_"] && [pp hasSuffix:@"_"])
    {
        key = [pp stringByReplacingOccurrencesOfString:@"_" withString:@""];
        key = [NSString stringWithFormat:@"{%@}", key];
    }
    return key;
}
+ (BOOL)exif_isSerializationObject:(id)object
{
    if([object isKindOfClass:[NSString class]])
    {
        return YES;
    }
    else if([object isKindOfClass:[NSNumber class]])
    {
        return YES;
    }
    else if([object isKindOfClass:[NSArray class]])
    {
        return YES;
    }
    else if([object isKindOfClass:[NSDictionary class]])
    {
        return YES;
    }
    else if([object isKindOfClass:[NSNull class]])
    {
        return YES;
    }
    else return NO;
}
@end

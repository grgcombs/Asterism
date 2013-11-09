//
//  ASTMap.m
//  Asterism
//
//  Created by Robert Böhnke on 5/22/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "ASTEach.h"

#import "ASTMap.h"

#pragma mark - Arrays

OVERLOADABLE NSArray *ASTMap(NSArray *array, id(^block)(id obj))
{
    NSCParameterAssert(array != nil);
    NSCParameterAssert(block != nil);

    return ASTMap(array, ^(id obj, NSUInteger _) {
        return block(obj);
    });
}

OVERLOADABLE NSArray *ASTMap(NSArray *array, id(^block)(id obj, NSUInteger idx))
{
    NSCParameterAssert(array != nil);
    NSCParameterAssert(block != nil);

    NSMutableArray *result = [NSMutableArray array];

    ASTEach(array, ^(id obj, NSUInteger idx) {
        id transformed = block(obj, idx);

        if (transformed != nil) {
            [result addObject:transformed];
        }
    });

    return result;
}

OVERLOADABLE NSDictionary *ASTMap(NSDictionary *dict, id(^block)(id obj))
{
    NSCParameterAssert(dict != nil);
    NSCParameterAssert(block != nil);

    return ASTMap(dict, ^(id _, id obj) {
        return block(obj);
    });
}

OVERLOADABLE NSDictionary *ASTMap(NSDictionary *dict, id(^block)(id key, id obj))
{
    NSCParameterAssert(dict != nil);
    NSCParameterAssert(block != nil);

    NSMutableDictionary *result = [NSMutableDictionary dictionary];

    ASTEach(dict, ^(id key, id obj) {
        id transformed = block(key, obj);

        if (transformed != nil) {
            result[key] = transformed;
        }
    });

    return result;
}

OVERLOADABLE NSSet *ASTMap(NSSet *set, id(^block)(id obj))
{
    NSCParameterAssert(set != nil);
    NSCParameterAssert(block != nil);

    NSMutableSet *result = [NSMutableSet set];

    ASTEach(set, ^(id obj) {
        id transformed = block(obj);

        if (transformed != nil) {
            [result addObject:transformed];
        }
    });

    return result;
}

OVERLOADABLE NSOrderedSet *ASTMap(NSOrderedSet *set, id(^block)(id obj))
{
    NSCParameterAssert(set != nil);
    NSCParameterAssert(block != nil);

    return ASTMap(set, ^(id obj, NSUInteger _) {
        return block(obj);
    });
}

OVERLOADABLE NSOrderedSet *ASTMap(NSOrderedSet *set, id(^block)(id obj, NSUInteger idx))
{
    NSCParameterAssert(set != nil);
    NSCParameterAssert(block != nil);

    NSMutableOrderedSet *result = [NSMutableOrderedSet orderedSet];

    ASTEach(set, ^(id obj, NSUInteger idx) {
        id transformed = block(obj, idx);

        if (transformed != nil) {
            [result addObject:transformed];
        }
    });

    return result;
}

//
//  ASTIndexBy.m
//  Asterism
//
//  Created by Robert Böhnke on 14/12/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "ASTReduce.h"

#import "ASTIndexBy.h"

OVERLOADABLE NSDictionary *ASTIndexBy(id<NSFastEnumeration> collection, id<NSCopying> (^block)(id)) {
    NSCParameterAssert(block != nil);

    if (collection == nil) return nil;

    return ASTReduce(collection, [NSMutableDictionary dictionary], ^(NSMutableDictionary *result, id obj) {
        id key = block(obj);

        if (key != nil) result[key] = obj;

        return result;
    });
}

OVERLOADABLE NSDictionary *ASTIndexBy(id<NSFastEnumeration> collection, NSString *keyPath) {
    return ASTIndexBy(collection, ^(id obj) {
        return [obj valueForKeyPath:keyPath];
    });
}
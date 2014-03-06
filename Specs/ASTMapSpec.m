//
//  ASTMapSpec.m
//  Asterism
//
//  Created by Robert Böhnke on 5/23/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "ASTMap.h"

SpecBegin(ASTMap)

describe(@"for arrays", ^{
    it(@"should not call the block when given an empty array", ^{
        __block NSUInteger calls = 0;

        ASTMap(@[], ^(id obj) {
            return @(calls++);
        });

        expect(calls).to.equal(0);
    });

    it(@"should replace the objects with the result of the block", ^{
        NSArray *before = @[ @1, @2, @3 ];

        NSArray *after = ASTMap(before, ^(id obj) {
            return [obj description];
        });

        expect(after).to.equal((@[ @"1", @"2", @"3" ]));
    });

    it(@"should remove all elements for which the block returns nil", ^{
        NSArray *even = ASTMap(@[ @0, @1, @2, @3 ], ^(NSNumber *number) {
            return number.integerValue % 2 == 0 ? number : nil;
        });

        expect(even).to.equal((@[ @0, @2 ]));
    });

    it(@"should call the block once for every object", ^{
        __block NSUInteger calls = 0;

        ASTMap(@[ @0, @1, @2 ], ^(id obj) {
            return @(calls++);
        });

        expect(calls).to.equal(3);
    });

    it(@"should optionally pass in the index", ^{
        ASTMap(@[ @0, @1, @2 ], ^(id obj, NSUInteger idx) {
            expect(obj).to.equal(@(idx));

            return @(idx);
        });
    });

    it(@"should maintain order", ^{
        NSArray *before = @[ @1, @2, @3, @4 ];

        NSArray *after = ASTMap(before, ^(id obj) { return obj; });

        expect(after).to.equal(before);
    });
});

describe(@"for dictionaries", ^{
    it(@"should not call the block when given an empty dictionary", ^{
        __block NSUInteger calls = 0;

        ASTMap(@{}, ^(id obj) {
            return @(calls++);
        });

        expect(calls).to.equal(0);
    });

    it(@"should replace the values with the result of the block", ^{
        NSDictionary *before = @{
            @"fr": @"Bonjour",
            @"en": @"Hello"
        };

        NSDictionary *after = ASTMap(before, ^(NSString *string) {
            return string.uppercaseString;
        });

        expect(after).to.equal((@{
            @"fr": @"BONJOUR",
            @"en": @"HELLO"
        }));
    });

    it(@"should remove all elements for which the block returns nil", ^{
        NSDictionary *before = @{
            @"fr": @"Bonjour",
            @"en": @"Hello"
        };

        NSDictionary *after = ASTMap(before, ^(NSString *string) {
            return [string isEqual:@"Bonjour"] ? string : nil;
        });

        expect(after).to.equal(@{
            @"fr": @"Bonjour"
        });
    });

    it(@"should call the block once for every key-value-pair", ^{
        __block NSUInteger calls = 0;

        NSDictionary *dictionary = @{
            @"fr": @"Bonjour",
            @"en": @"Hello"
        };

        ASTMap(dictionary, ^(id obj) {
            return @(calls++);
        });

        expect(calls).to.equal(2);
    });

    it(@"should optionally pass in the key", ^{
        ASTMap(@{ @"foo": @"FOO" }, ^(id key, id obj) {
            expect([key uppercaseString]).to.equal(obj);

            return obj;
        });
    });
});

describe(@"for sets", ^{
    it(@"should not call the block when given an empty set", ^{
        __block NSUInteger calls = 0;

        ASTMap([[NSSet alloc] init], ^(id obj) {
            return @(calls++);
        });

        expect(calls).to.equal(0);
    });

    it(@"should replace the objects with the result of the block", ^{
        NSSet *before = [NSSet setWithArray:@[ @1, @2, @3 ]];

        NSSet *after = ASTMap(before, ^(id obj) {
            return [obj description];
        });

        expect(after).to.equal(([NSSet setWithArray:@[
            @"1", @"2", @"3"
        ]]));
    });

    it(@"should remove all elements for which the block returns nil", ^{
        NSSet *numbers = [NSSet setWithArray:@[ @0, @1, @2, @3 ]];

        NSSet *even = ASTMap(numbers, ^(NSNumber *number) {
            return number.integerValue % 2 == 0 ? number : nil;
        });

        expect(even).to.equal(([NSSet setWithArray:@[ @0, @2 ]]));
    });

    it(@"should call the block once for every object", ^{
        __block NSUInteger calls = 0;

        NSSet *set = [NSSet setWithArray:@[ @1, @2, @3 ]];

        ASTMap(set, ^(id obj) {
            return @(calls++);
        });

        expect(calls).to.equal(3);
    });
});

describe(@"for ordered sets", ^{
    it(@"should not call the block when given an empty array", ^{
        __block NSUInteger calls = 0;

        ASTMap([NSOrderedSet orderedSet], ^(id obj) {
            return @(calls++);
        });

        expect(calls).to.equal(0);
    });

    it(@"should replace the objects with the result of the block", ^{
        NSOrderedSet *before = [NSOrderedSet orderedSetWithArray:@[ @1, @2, @3 ]];

        NSOrderedSet *after = ASTMap(before, ^(id obj) {
            return [obj description];
        });

        expect(after).to.equal(([NSOrderedSet orderedSetWithArray:@[ @"1", @"2", @"3" ]]));
    });

    it(@"should remove all elements for which the block returns nil", ^{
        NSOrderedSet *numbers = [NSOrderedSet orderedSetWithArray:@[ @0, @1, @2, @3 ]];

        NSOrderedSet *even = ASTMap(numbers, ^(NSNumber *number) {
            return number.integerValue % 2 == 0 ? number : nil;
        });

        expect(even).to.equal(([NSOrderedSet orderedSetWithArray:@[ @0, @2 ]]));
    });

    it(@"should call the block once for every object", ^{
        NSOrderedSet *numbers = [NSOrderedSet orderedSetWithArray:@[ @1, @2, @3 ]];
        __block NSUInteger calls = 0;

        ASTMap(numbers, ^(id obj) {
            return @(calls++);
        });

        expect(calls).to.equal(3);
    });

    it(@"should optionally pass in the index", ^{
        NSOrderedSet *numbers = [NSOrderedSet orderedSetWithArray:@[ @0, @1, @2 ]];

        ASTMap(numbers, ^(id obj, NSUInteger idx) {
            expect(obj).to.equal(@(idx));

            return @(idx);
        });
    });

    it(@"should maintain order", ^{
        NSOrderedSet *before = [NSOrderedSet orderedSetWithArray:@[ @1, @2, @3 ]];

        NSOrderedSet *after = ASTMap(before, ^(id obj) { return obj; });
        
        expect(after).to.equal(before);
    });
});

SpecEnd

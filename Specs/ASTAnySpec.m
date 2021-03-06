//
//  ASTAnySpec.m
//  Asterism
//
//  Created by Robert Böhnke on 01/12/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Asterism/Asterism.h>

BOOL (^isOdd)(NSNumber *) = ^BOOL (NSNumber *number) {
    return number.integerValue % 2 == 1;
};

QuickSpecBegin(ASTAnySpec)

it(@"should return NO for empty collections", ^{
    expect(@(ASTAny((id<NSFastEnumeration>)nil, ^(id obj){ return NO; }))).to(beFalsy());

    expect(@(ASTAny(@[], ^(id obj){ return NO; }))).to(beFalsy());
});

it(@"should return YES if one element passes the test", ^{
    NSArray *numbers = @[ @2, @4, @6, @8, @9 ];

    expect(@(ASTAny(numbers, isOdd))).to(beTruthy());
});

it(@"should return NO if all elements fail the test", ^{
    NSArray *numbers = @[ @2, @4, @6, @8 ];

    expect(@(ASTAny(numbers, isOdd))).to(beFalsy());
});

it(@"should use the values of dictionaries", ^{
    NSDictionary *dict = @{ @"foo": @1 };

    expect(@(ASTAny(dict, isOdd))).to(beTruthy());
});

QuickSpecEnd

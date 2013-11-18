//
//  ASTTail.h
//  Asterism
//
//  Created by Robert Böhnke on 6/1/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ASTConstants.h"

// Returns all elements of an array after the first one.
//
// array - An array of elements.
//
// Returns all elements after the first one. If the array has less than one
// element, an empty array is returned.
OVERLOADABLE NSArray *ASTTail(NSArray *array);

// Returns all elements of an ordered set after the first one.
//
// set - An ordered set of elements.
//
// Returns all elements after the first one. If the set has less than one
// element, an empty ordered set is returned.
OVERLOADABLE NSOrderedSet *ASTTail(NSOrderedSet *set);

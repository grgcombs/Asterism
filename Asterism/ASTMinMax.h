//
//  ASTMinMax.h
//  Asterism
//
//  Created by Robert Böhnke on 6/4/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

// You should not call these methods directly.
id __ASTMin_NSFastEnumeration(id<NSFastEnumeration> collection);
id __ASTMin_NSFastEnumeration_comparator(id<NSFastEnumeration> collection, NSComparator comparator);
id __ASTMax_NSFastEnumeration(id<NSFastEnumeration> collection);
id __ASTMax_NSFastEnumeration_comparator(id<NSFastEnumeration> collection, NSComparator comparator);

// Returns the minimum of a collection by invoking -compare:.
//
// collection - An object that implements NSFastEnumeration.
//
// Returns the minimum of the collection by comparing all values by invoking
// -compare:.
static inline __attribute__((overloadable)) id ASTMin(id<NSFastEnumeration> collection) {
    return __ASTMin_NSFastEnumeration(collection);
}

// Returns the minimum of a collection by using an NSComparator.
//
// collection - An object that implements NSFastEnumeration.
// comparator - An NSComparator used to compare the values.
//              This argument must not be nil.
//
// Returns the minimum of the collection by comparing all values using
// `comparator`.
static inline __attribute__((overloadable)) id ASTMin(id<NSFastEnumeration> collection, NSComparator comparator) {
    return __ASTMin_NSFastEnumeration_comparator(collection, comparator);
}

// Returns the maximum of a collection by invoking -compare:.
//
// collection - An object that implements NSFastEnumeration.
//
// Returns the maximum of the collection by comparing all values by invoking
// -compare:.
static inline __attribute__((overloadable)) id ASTMax(id<NSFastEnumeration> collection) {
    return __ASTMax_NSFastEnumeration(collection);
}

// Returns the maximum of a collection by using an NSComparator.
//
// collection - An object that implements NSFastEnumeration.
// comparator - An NSComparator used to compare the values.
//              This argument must not be nil.
//
// Returns the maximum of the collection by comparing all values using
// `comparator`.
static inline __attribute__((overloadable)) id ASTMax(id<NSFastEnumeration> collection, NSComparator comparator) {
    return __ASTMax_NSFastEnumeration_comparator(collection, comparator);
}

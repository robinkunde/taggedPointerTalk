//
//  main.m
//  TaggedPointerDemo
//
//  Created by Robin Kunde on 9/9/15.
//  Copyright (c) 2015 Robin Kunde. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // initialize tagged pointer runtime
        (void)[[NSString alloc] init];

        // declare 64bit integer
        long tmp = 0;

        // mark as tagged pointer
        tmp |= 1;

        // mark as type NSString
        tmp |= 2 << 1;

        // set length = 11
        tmp |= 11 << 4;

        // add 11 5-bit encoded characters
        tmp |= 5UL  << (5 * 10 + 8);
        tmp |= 1UL  << (5 *  9 + 8);
        tmp |= 14UL << (5 *  8 + 8);
        tmp |= 18UL << (5 *  7 + 8);
        tmp |= 15UL << (5 *  6 + 8);
        tmp |= 5UL  << (5 *  5 + 8);
        tmp |= 3UL  << (5 *  4 + 8);
        tmp |= 2UL  << (5 *  3 + 8);
        tmp |= 2UL  << (5 *  2 + 8);
        tmp |= 0UL  << (5 *  1 + 8);
        tmp |= 10UL << (5 *  0 + 8);

        // cast integer to NSString pointer
        NSString *var = (__bridge_transfer NSString *)(void*)tmp;

        // finally, call the description method on object and print out the result
        NSLog(@"%@", [var description]);
    }

    return 0;
}

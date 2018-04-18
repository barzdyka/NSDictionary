//
//  ViewController.m
//  Dictionary
//
//  Created by Viktoryia Barzdyka on 4/12/18.
//  Copyright © 2018 Barzdyka. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Create NSDictionary using literal declaration
    NSDictionary* dict = @{
                           @"name": @"Peter",
                           @"surname": @"Ivanov",
                           @"age": @"30"
                           };
    NSLog(@"Dictionary: %@",dict);
    
    //Make it mutable and add several new entries.
    NSMutableDictionary* mutableDict = [dict mutableCopy];
    [mutableDict setObject:@"Minsk" forKey:@"city"];
    [mutableDict setObject:@"Belarus" forKey:@"country"];
    NSLog(@"\nMutable Dictionary: %@",mutableDict);
    
    //Sort it in an ascending and descending order(by keys)
    NSArray *sortedKeys = [mutableDict allKeys];
    NSArray *ascendingMutableDictKeys = [sortedKeys sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    NSLog(@"\nMutable Dictionary sorted by key in ascending order:");
    for (NSString *key in ascendingMutableDictKeys) {
        NSLog(@"%@ - %@", key, [mutableDict valueForKey:key]);
    }
    
    //by keys in descending order
    NSArray *descendingMutableDictKeys = [sortedKeys sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [obj2 compare:obj1];
    }];
    NSLog(@"\nMutable Dictionary sorted by key in descending order:");
    for (NSString *key in descendingMutableDictKeys) {
        NSLog(@"%@ - %@", key, [mutableDict valueForKey:key]);
    }
    
    //Sort it in an ascending and descending order(by values)
    NSArray *keysSortedByValueUsingComparator = [mutableDict keysSortedByValueUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [obj1 compare:obj2];
    }];
    NSLog(@"\nMutable Dictionary sorted by value in ascending order:");
    for (NSString *key in keysSortedByValueUsingComparator) {
        NSLog(@"%@ - %@", key, [mutableDict valueForKey:key]);
    }
    
    //by values in descending order
    NSArray *keysSortedByValueUsingComparatorDescending = [mutableDict keysSortedByValueUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [obj2 compare:obj1];
    }];
    NSLog(@" \nMutable Dictionary sorted by value in descending order:");
    for (NSString *key in keysSortedByValueUsingComparatorDescending) {
        NSLog(@"%@ - %@", key, [mutableDict valueForKey:key]);
    }
    
    //Check whether required value is contained in the dictionary.
    NSString *requiredValue = @"Ivanov1";
    NSArray *allValues = [mutableDict allValues];
    
    if ([allValues containsObject:requiredValue]){
        NSLog(@"The value %@ is in the Dictionary", requiredValue);
    }
    else {
        NSLog(@"There is no such a value");
    }
    
    [mutableDict release];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

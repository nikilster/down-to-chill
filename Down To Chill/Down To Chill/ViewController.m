//
//  ViewController.m
//  Down To Chill
//
//  Created by Nikil Viswanathan on 11/29/14.
//  Copyright (c) 2014 Nikil Viswanathan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    testObject[@"foo"] = @"bar";
    [testObject saveInBackground];
}

@end

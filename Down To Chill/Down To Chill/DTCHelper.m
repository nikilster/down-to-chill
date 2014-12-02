//
//  DTCHelper.m
//  Down To Chill
//
//  Created by Nikil Viswanathan on 11/29/14.
//  Copyright (c) 2014 Nikil Viswanathan. All rights reserved.
//

#import "DTCHelper.h"

@implementation DTCHelper

/*
 Show Alert With Title
 ---------------------
 Utility for showing alert
 */
+ (void)showAlertWithTitle:(NSString *)title
                andMessage:(NSString *)message
       andCancelButtonText:(NSString *)cancelButtonText
          inViewController:(UIViewController *)presentingViewController
{
    //If iOS 8 and we can use the alert controller
    if([UIAlertController class])
    {
        //Create the controller
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        
        //Cancel
        UIAlertAction* cancelButton = [UIAlertAction actionWithTitle:cancelButtonText style:UIAlertActionStyleDefault
                                                             handler:^(UIAlertAction * action) {
                                                             }];
        //Add the cancel button
        [alert addAction:cancelButton];
        
        //Show the controller
        [presentingViewController presentViewController:alert animated:YES completion:nil];
        
    }
    
    //Use the old alert views
    else
    {
        UIAlertView *alertMessage = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:cancelButtonText otherButtonTitles:nil];
        [alertMessage show];
    }
}

@end

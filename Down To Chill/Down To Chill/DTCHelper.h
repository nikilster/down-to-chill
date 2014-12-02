//
//  DTCHelper.h
//  Down To Chill
//
//  Created by Nikil Viswanathan on 11/29/14.
//  Copyright (c) 2014 Nikil Viswanathan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface DTCHelper : NSObject

/*
 Show Alert With Title
 ---------------------
 Utility for showing alert
 */
+ (void)showAlertWithTitle:(NSString *)title
                andMessage:(NSString *)message
       andCancelButtonText:(NSString *)cancelButtonText
          inViewController:(UIViewController *)presentingViewController;
@end

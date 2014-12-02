//
//  LoginViewController.m
//  Down To Chill
//
//  Created by Nikil Viswanathan on 11/29/14.
//  Copyright (c) 2014 Nikil Viswanathan. All rights reserved.
//

#import "LoginViewController.h"
#import <MessageUI/MessageUI.h>
#import "DTCHelper.h"

@interface LoginViewController () <MFMessageComposeViewControllerDelegate>

@property (nonatomic, strong) NSString *deviceToken;
@property (weak, nonatomic) IBOutlet UIButton *authenticateButton;
@end

@implementation LoginViewController

#define PHONE_VERIFICATION_NUMBER @"+1 (650) 215-6102"

- (IBAction)authenticateButtonClicked:(UIButton *)sender {
    
    //Disable the button after press
    [sender setEnabled:NO];
    
    //Make sure we can send texts
    if(![MFMessageComposeViewController canSendText])
    {
        [DTCHelper showAlertWithTitle:@"Oh no :(" andMessage:@"Please use a phone that can send texts to verify your number." andCancelButtonText:@"Got it" inViewController:self];
        
        //Re-enable button
        [((UIButton *)sender) setEnabled:YES];
        return;
    }
    
    
    
    //Clear the global style
    //[OMGHelper clearGlobalNavigationBarColor];
    
    //Create the view
    MFMessageComposeViewController *verifyPhoneNumberTextComposer = [[MFMessageComposeViewController alloc] init];
    verifyPhoneNumberTextComposer.messageComposeDelegate = self;
    verifyPhoneNumberTextComposer.recipients = @[PHONE_VERIFICATION_NUMBER];
    verifyPhoneNumberTextComposer.body = [NSString stringWithFormat:@"Send this text to verify your phone number. (%@)", self.deviceToken];
    
    verifyPhoneNumberTextComposer.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    //Show the view
    [self presentViewController:verifyPhoneNumberTextComposer animated:YES completion:nil];
}



/*
 Message Compose View Controller Did Finish With Result
 -------------------
 Delegate method for when the message compose view controller finishes.  If successful, segue to Find Friends page.  If not,
 do nothing or show alert (allow them to try again or skip).
 */
- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    //Set the navigation bar style back to light
    //[OMGHelper setGlobalNavigationBarLightColor];
    
    //Dismiss the view controller
    [self dismissViewControllerAnimated:YES completion:nil];
    
    if(result == MessageComposeResultFailed) NSLog(@"Failed");
    if(result == MessageComposeResultSent) NSLog(@"Sent");
    if(result == MessageComposeResultCancelled) NSLog(@"Canceled");
    
    
    //Fail
    if(result == MessageComposeResultFailed)
    {
        //Re-enable button
        [self.authenticateButton setEnabled:YES];
        
        [DTCHelper showAlertWithTitle:@"Uh Oh" andMessage:@"The phone couldn't send the text.  Try again!" andCancelButtonText:@"Okay" inViewController:self];
    }
    
    //Success
    else if(result == MessageComposeResultSent)
    {
        //TODO: add confirmation?
        
        //[self performSegueWithIdentifier:SHOW_FIND_FRIENDS sender:self];
        NSLog(@"Authenticated! Time to do segue!");
    }
    
    //Canceled
    else
    {
        //Re-enable button
        [self.authenticateButton setEnabled:YES];
    }
    
    //Canceled
    //Do Nothing
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Generate Device Token
    //TODO: generate device token
    self.deviceToken = @"ASDF";
}

@end

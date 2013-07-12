//
//  ValidationViewController.m
//  MHValidationViewController
//
//  Created by Mario Hahn on 12.07.13.
//  Copyright (c) 2013 Mario Hahn. All rights reserved.
//

#import "ValidationViewController.h"

@interface ValidationViewController ()

@end

@implementation ValidationViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.validateButton addTarget:self action:@selector(validateButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    self.firstName.accessibilityIdentifier = @"Firstname";
    self.secondName.accessibilityIdentifier = @"Secondname";
    self.email.accessibilityIdentifier = @"E-Mail";
           
}
-(void)validateButtonAction{
    
    MHValidationItem *emailValidation = [[MHValidationItem alloc]initWithObject:self.email andRegexString:MHValidationRegexEmail];
    
    [self.scrollView validateObjectOfClass:@[[UITextField class]]
                     withNonMandatoryField:nil
andShouldValidateObjectsWithMHRegexObjects:@[emailValidation]
                  andSwitchesWhichMustBeON:nil
                        curruptObjectBlock:^(NSArray *curruptItem) {
                            
                                                [self.scrollView shakeObjects:curruptItem andChangeBorderColor:nil];
                            
                            } successBlock:^(NSString *emailString, NSDictionary *valueKeyEmail, NSArray *object, bool isFirstRegistration) {
                                
                                NSLog(@"%@",emailString);
                                NSLog(@"%@",valueKeyEmail);
                                NSLog(@"%@",object);
        
                                }];
}


@end

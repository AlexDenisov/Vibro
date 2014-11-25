//
//  ViewController.m
//  Sample
//
//  Created by AlexDenisov on 25/11/14.
//  Copyright (c) 2014 AlexDenisov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *URLTextField;
@end

@implementation ViewController

- (IBAction)didTapGoButton:(id)sender {
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.URLTextField.text]];
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request];
    [task resume];
}

@end

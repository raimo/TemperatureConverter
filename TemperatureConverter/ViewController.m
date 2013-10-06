//
//  ViewController.m
//  TemperatureConverter
//
//  Created by Raimo Tuisku on 6.10.2013.
//  Copyright (c) 2013 Raimo Tuisku. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *celcius;
@property (weak, nonatomic) IBOutlet UITextField *fahrenheit;
- (IBAction)convertPressed:(id)sender;
- (IBAction)onTap:(id)sender;
- (IBAction)celciusChanged:(id)sender;
- (IBAction)fahrenheitChanged:(id)sender;
- (IBAction)fahrenheitTapped:(id)sender;
- (IBAction)celciusTapped:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Raimo's Temperature Converter";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)convertPressed:(id)sender {
    if ([self.celcius.text length] == 0) {
        float value = ([self.fahrenheit.text floatValue] - 32) * 5.0 / 9;
        self.celcius.text = [NSString stringWithFormat:@"%0.2f", value];
    } else if ([self.fahrenheit.text length] == 0) {
        float value = [self.celcius.text floatValue] * 9.0/5 + 32;
        self.fahrenheit.text = [NSString stringWithFormat:@"%0.2f", value];

    }
}
- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)celciusChanged:(id)sender {
    self.fahrenheit.text = @"";
    [self convertPressed:sender];
}

- (IBAction)fahrenheitChanged:(id)sender {
    self.celcius.text = @"";
    [self convertPressed:sender];
}

- (IBAction)fahrenheitTapped:(id)sender {
    if ([self.fahrenheit.text isEqualToString:@"Fahrenheit"]) {
        self.fahrenheit.text = @"";
    }
}

- (IBAction)celciusTapped:(id)sender {
    if ([self.celcius.text isEqualToString:@"Celcius"]) {
        self.celcius.text = @"";
    }
}
@end

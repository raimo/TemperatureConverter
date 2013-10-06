//
//  ViewController.m
//  TemperatureConverter
//
//  Created by Raimo Tuisku on 6.10.2013.
//  Copyright (c) 2013 Raimo Tuisku. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *celsius;
@property (weak, nonatomic) IBOutlet UITextField *fahrenheit;
- (IBAction)doConversion:(id)sender;
- (IBAction)onTap:(id)sender;
- (IBAction)celsiusChanged:(id)sender;
- (IBAction)fahrenheitChanged:(id)sender;
- (IBAction)fahrenheitTapped:(id)sender;
- (IBAction)celsiusTapped:(id)sender;

@end

@implementation ViewController
NSString *const CELSIUS_LABEL = @"Celsius";
NSString *const FAHRENHEIT_LABEL = @"Fahrenheit";

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

- (IBAction)doConversion:(id)sender {
    if ([self.celsius.text length] == 0 && [self.fahrenheit.text length] == 0) {
        self.celsius.text = CELSIUS_LABEL;
        self.fahrenheit.text = FAHRENHEIT_LABEL;
    }
    if ([self.celsius.text length] == 0) {
        float value = ([self.fahrenheit.text floatValue] - 32) * 5.0 / 9;
        self.celsius.text = [NSString stringWithFormat:@"%0.2f", value];
    } else if ([self.fahrenheit.text length] == 0) {
        float value = [self.celsius.text floatValue] * 9.0/5 + 32;
        self.fahrenheit.text = [NSString stringWithFormat:@"%0.2f", value];

    }
}
- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)celsiusChanged:(id)sender {
    self.fahrenheit.text = @"";
    [self doConversion:sender];
}

- (IBAction)fahrenheitChanged:(id)sender {
    self.celsius.text = @"";
    [self doConversion:sender];
}

- (IBAction)fahrenheitTapped:(id)sender {
    if ([self.fahrenheit.text isEqualToString:FAHRENHEIT_LABEL]) {
        self.fahrenheit.text = @"";
    }
}

- (IBAction)celsiusTapped:(id)sender {
    if ([self.celsius.text isEqualToString:CELSIUS_LABEL]) {
        self.celsius.text = @"";
    }
}
@end

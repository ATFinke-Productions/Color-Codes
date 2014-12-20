//
//  EditorViewController.m
//  colorcodes
//
//  Created by Andrew on 6/18/13.
//  Copyright (c) 2013 ATFinke Productions Incorperated. All rights reserved.
//

#import "EditorViewController.h"

@interface EditorViewController ()

@end

@implementation EditorViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    colorView.backgroundColor = [UIColor grayColor];
    
    for (UILabel * label in self.view.subviews ) {
        if (label.tag == 10) {
             label.textColor = [UIColor whiteColor];
        }
    }
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Change Values" message:@"Tap the Hex button to toggle between RGB values and Hex values." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
    
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(shareColor:)];
    self.navigationItem.rightBarButtonItems = @[item,self.navigationItem.rightBarButtonItem];
	// Do any additional setup after loading the view.
}

- (void) shareColor:(id)sender {
    UIActivityViewController *vc = [[UIActivityViewController alloc] initWithActivityItems:@[rgbLabel.text] applicationActivities:nil];
    if ([[UIDevice currentDevice] systemVersion].doubleValue >= 8.0) {
        vc.popoverPresentationController.sourceView = sender;
    }
    [self presentViewController:vc animated:true completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)textColorChange:(id)sender {
    NSArray *labels = @[label1,label2,label3,label4,label5];
    for (UILabel * label in labels) {
        if (textColor.selectedSegmentIndex == 0) {
                label.textColor = [UIColor whiteColor];
        }
        else {
            label.textColor = [UIColor blackColor];
        }
    }
}


- (IBAction)switchDisplay:(id)sender {
    UIBarButtonItem *item = (UIBarButtonItem*)sender;
    if (!showHex) {
        showHex = YES;
        item.title = @"RGB";
    }
    else {
        showHex = NO;
        item.title = @"Hex";
    }
    [self updateLabel];
}

- (IBAction)switchUpdated:(id)sender {

    colorView.backgroundColor = [UIColor colorWithRed:redValue.value green:greenValue.value blue:blueValue.value alpha:alphaValue.value];
    
    [self updateLabel];
}

- (void)updateLabel {
    if (!showHex) {
        rgbLabel.text = [NSString stringWithFormat:@"RGB: (%@, %@, %@)\nAlpha: %@",[self forFloat:redValue.value*255 includeZeros:YES],[self forFloat:greenValue.value*255 includeZeros:YES],[self forFloat:blueValue.value*255 includeZeros:YES],[self forFloat:alphaValue.value includeZeros:YES]];
    }
    else {
        rgbLabel.text = [NSString stringWithFormat:@"Hex: #%@%@%@\nAlpha: %@",[self convertToHex:redValue.value*255], [self convertToHex:greenValue.value*255 ], [self convertToHex:blueValue.value*255],[self forFloat:alphaValue.value includeZeros:YES]];
    }
}

- (NSString *) forFloat:(float)number includeZeros:(BOOL)zeros {
    NSArray * decimalDivideArray = [[NSString stringWithFormat:@"%f",number] componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"."]];
    NSString * setOne = decimalDivideArray[0];
    NSString * setTwo;
    if (decimalDivideArray.count > 1) {
        if (((NSString*)decimalDivideArray[1]).length > 2) {
            setTwo = [decimalDivideArray[1] substringToIndex:2];
        }
    }
    
    if ([setTwo isEqualToString:@"00"] && !zeros) {
        return setOne;
    }
    return [NSString stringWithFormat:@"%@.%@",setOne,setTwo];
}
- (NSString *)convertToHex:(int)decimal{
	int firstDig = decimal/16;
	int seconDig = decimal%16;

	NSString *output;
	
	switch (firstDig) {
		case 15:
			output = @"F";
			break;
		case 14:
			output = @"E";
			break;
		case 13:
			output = @"D";
			break;
		case 12:
			output = @"C";
			break;
		case 11:
			output = @"B";
			break;
		case 10:
			output = @"A";
			break;
            
		default:
			output = [NSString stringWithFormat:@"%d", firstDig];
			break;
	}
	
	switch (seconDig) {
		case 15:
			output = [output stringByAppendingString:@"F"];
			break;
		case 14:
			output = [output stringByAppendingString:@"E"];
			break;
		case 13:
			output = [output stringByAppendingString:@"D"];
			break;
		case 12:
			output = [output stringByAppendingString:@"C"];
			break;
		case 11:
			output = [output stringByAppendingString:@"B"];
			break;
		case 10:
			output = [output stringByAppendingString:@"A"];
			break;
		default:
			output = [output stringByAppendingFormat:@"%d", seconDig];
			break;
	}

	return output;
}

@end

//
//  EditorViewController.h
//  colorcodes
//
//  Created by Andrew on 6/18/13.
//  Copyright (c) 2013 ATFinke Productions Incorperated. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditorViewController : UIViewController {
    IBOutlet UISlider * redValue;
    IBOutlet UISlider * greenValue;
    IBOutlet UISlider * blueValue;
    IBOutlet UISlider * alphaValue;
    
    IBOutlet UILabel * rgbLabel;
    IBOutlet UISegmentedControl * textColor;
    IBOutlet UIView *colorView;
    
    __weak IBOutlet UILabel *label1;
    __weak IBOutlet UILabel *label2;
    __weak IBOutlet UILabel *label3;
    __weak IBOutlet UILabel *label4;
    __weak IBOutlet UILabel *label5;
    BOOL showHex;
}

- (IBAction)switchUpdated:(id)sender;
- (IBAction)textColorChange:(id)sender;
- (IBAction)switchDisplay:(id)sender;

@end

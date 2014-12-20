//
//  StrobeViewController.h
//  colorcodes
//
//  Created by Andrew on 6/18/13.
//  Copyright (c) 2013 ATFinke Productions Incorperated. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StrobeViewController : UIViewController {
    IBOutlet UISlider * slider;
    NSTimer * refreshTimer;
    __weak IBOutlet UIView *colorView;
}

- (IBAction)changeSpeed:(id)sender;


@end

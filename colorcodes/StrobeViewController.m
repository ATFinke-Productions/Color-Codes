//
//  StrobeViewController.m
//  colorcodes
//
//  Created by Andrew on 6/18/13.
//  Copyright (c) 2013 ATFinke Productions Incorperated. All rights reserved.
//

#import "StrobeViewController.h"

@interface StrobeViewController () {
    NSMutableArray * usableColors;
}

@end

@implementation StrobeViewController

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
    // Do any additional setup after loading the view.
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeSpeed:(id)sender {
    [refreshTimer invalidate];
    refreshTimer = [NSTimer scheduledTimerWithTimeInterval:slider.value target:self selector:@selector(changeBackgroundColor) userInfo:nil repeats:YES];
}

- (void) viewWillAppear:(BOOL)animated {
    
    usableColors = [[NSMutableArray alloc]init];
    [usableColors removeAllObjects];
    
    NSArray * array = [[NSArray alloc]init];
    array = [[NSUserDefaults standardUserDefaults] valueForKey:@"colors"];
    
    for (NSString * string in array) {
        int index = (int)[string integerValue];
        if (index == 0) {
            [usableColors addObject:@"Black"];
        }
        else if (index == 1) {
            [usableColors addObject:@"White"];
        }
        else if (index == 2) {
            [usableColors addObject:@"Red"];
        }
        else if (index == 3) {
            [usableColors addObject:@"Green"];
        }
        else if (index == 4) {
            [usableColors addObject:@"Blue"];
        }
        else if (index == 5) {
            [usableColors addObject:@"Brown"];
        }
        else if (index == 6) {
            [usableColors addObject:@"Dark Gray"];
        }
        else if (index == 7) {
            [usableColors addObject:@"Gray"];
        }
        else if (index == 8) {
            [usableColors addObject:@"Light Gray"];
        }
        else if (index == 9) {
            [usableColors addObject:@"Magenta"];
        }
        else if (index == 10) {
            [usableColors addObject:@"Orange"];
        }
        else if (index == 11) {
            [usableColors addObject:@"Purple"];
        }
        else if (index == 12) {
            [usableColors addObject:@"Yellow"];
        }
    }
    
    if (usableColors.count == 0) {
        [usableColors addObject:@"Black"];
        [usableColors addObject:@"White"];
    }
    
    refreshTimer = [NSTimer scheduledTimerWithTimeInterval:slider.value target:self selector:@selector(changeBackgroundColor) userInfo:nil repeats:YES];
    
}
- (void) viewWillDisappear:(BOOL)animated {
    [refreshTimer invalidate];
}

- (void) changeBackgroundColor {
    for (BOOL newColor = NO; newColor == NO; nil) {
         UIColor * newBackround = [self colorForString:usableColors[arc4random() % usableColors.count]];
        if (![newBackround isEqual:self.view.backgroundColor]) {
            colorView.backgroundColor = newBackround;
            newColor = YES;
        }
        else if (usableColors.count == 1) {
            return;
        }
    }
}

- (UIColor *)colorForString:(NSString *)string {
    if ([string isEqualToString:@"Black"]) {
        return [UIColor blackColor];
    }
    else if ([string isEqualToString:@"Black"]) {
        return [UIColor blackColor];
    }
    else if ([string isEqualToString:@"White"]) {
        return [UIColor whiteColor];
    }
    else if ([string isEqualToString:@"Red"]) {
        return [UIColor redColor];
    }
    else if ([string isEqualToString:@"Green"]) {
        return [UIColor greenColor];
    }
    else if ([string isEqualToString:@"Blue"]) {
        return [UIColor blueColor];
    }
    else if ([string isEqualToString:@"Brown"]) {
        return [UIColor brownColor];
    }
    else if ([string isEqualToString:@"Dark Gray"]) {
        return [UIColor darkGrayColor];
    }
    else if ([string isEqualToString:@"Gray"]) {
        return [UIColor grayColor];
    }
    else if ([string isEqualToString:@"Light Gray"]) {
        return [UIColor lightGrayColor];
    }
    else if ([string isEqualToString:@"Magenta"]) {
        return [UIColor magentaColor];
    }
    else if ([string isEqualToString:@"Orange"]) {
        return [UIColor orangeColor];
    }
    else if ([string isEqualToString:@"Purple"]) {
        return [UIColor purpleColor];
    }
    else if ([string isEqualToString:@"Yellow"]) {
        return [UIColor yellowColor];
    }
    return nil;
}


@end

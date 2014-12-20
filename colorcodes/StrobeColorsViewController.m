//
//  StrobeColorsViewController.m
//  colorcodes
//
//  Created by Andrew on 6/18/13.
//  Copyright (c) 2013 ATFinke Productions Incorperated. All rights reserved.
//

#import "StrobeColorsViewController.h"

@interface StrobeColorsViewController ()

@end

@implementation StrobeColorsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void) viewWillDisappear:(BOOL)animated {
    
    
    
    NSMutableArray * rows = [[NSMutableArray alloc]init];
    
    for (NSIndexPath * indexpath in [self.tableView indexPathsForSelectedRows]) {
        [rows addObject:[NSString stringWithFormat:@"%ld",(long)indexpath.row]];
    }
    
    [[NSUserDefaults standardUserDefaults] setValue:rows forKey:@"colors"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)selectAllIndex:(id)sender {
    for (NSInteger s = 0; s < self.tableView.numberOfSections; s++) {
        for (NSInteger r = 0; r < [self.tableView numberOfRowsInSection:s]; r++) {
            [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:r inSection:s]
                                        animated:NO
                                  scrollPosition:UITableViewScrollPositionNone];
        }
    }
}


@end

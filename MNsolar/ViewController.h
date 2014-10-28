//
//  ViewController.h
//  MNsolar
//
//  Created by Chris Martin on 10/25/14.
//  Copyright (c) 2014 Chris Martin. All rights reserved.
//

#import <UIKit/UIKit.h>

//Import the header file for ArcGIS framework
#import <ArcGIS/ArcGIS.h>

@interface ViewController : UIViewController

//LAYOUT
@property (weak, nonatomic) IBOutlet UIToolbar *toolBar;
@property (weak, nonatomic) IBOutlet UIToolbar *menuTool;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *bookmarkTool;


@property (weak, nonatomic) IBOutlet UISegmentedControl *basemapToggle;
- (IBAction)basemapChanged:(id)sender;


// MAP
@property (weak, nonatomic) IBOutlet AGSMapView *mapView;

@end


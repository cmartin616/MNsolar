//
//  ViewController.m
//  MNsolar
//
//  Created by Chris Martin on 10/25/14.
//  Copyright (c) 2014 Chris Martin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <AGSMapViewLayerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //2. Set the map view's layerDelegate
    self.mapView.layerDelegate = self;
    
    //Add a basemap tiled layer
    NSURL* url = [NSURL URLWithString:@"http://server.arcgisonline.com/arcgis/rest/services/World_Imagery/MapServer"];
    AGSTiledMapServiceLayer *aerialLayer = [AGSTiledMapServiceLayer tiledMapServiceLayerWithURL:url];
    [self.mapView addMapLayer:aerialLayer withName:@"Aerial Basemap Tiled Layer"];
    
    //NSLog(@"Spatial Reference : %@", aerialLayer.spatialReference);
    
    //enable wrap around
    [self.mapView enableWrapAround];
    
    // Zoom to envelop
    
    //AGSSpatialReference *sr = [AGSSpatialReference webMercatorSpatialReference];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//3. Implement the layer delegate method
- (void)mapViewDidLoad:(AGSMapView *) mapView {
    //do something now that the map is loaded
    //for example, show the current location on the map
    NSLog(@"Spatial Reference2: %@", self.mapView.spatialReference);
    NSLog(@"Trying to Zoom");
    //NSLog(@"SR: %@", sr);
    AGSEnvelope *envelope = [AGSEnvelope envelopeWithXmin:-89.566667 ymin:63.566667 xmax:97.2  ymax:99.383333  spatialReference:self.mapView.spatialReference];
    NSLog(@"Envelope: %@", envelope);
    //[self.mapView zoomToEnvelope:envelope animated:YES];
};
// Custom function

- (IBAction)basemapChanged:(id)sender {
    NSURL* basemapURL ;
    UISegmentedControl* segControl = (UISegmentedControl*)sender;
    switch (segControl.selectedSegmentIndex) {
        case 0: //gray
            basemapURL = [NSURL URLWithString:@"http://services.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Light_Gray_Base/MapServer"];
            break;
        case 1: //oceans
            basemapURL = [NSURL URLWithString:@"http://services.arcgisonline.com/ArcGIS/rest/services/Ocean_Basemap/MapServer"];
            break;
        case 2: //nat geo
            basemapURL = [NSURL URLWithString:@"http://services.arcgisonline.com/ArcGIS/rest/services/NatGeo_World_Map/MapServer"];
            break;
        case 3: //topo
            basemapURL = [NSURL URLWithString:@"http://services.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer"];
            break;
        case 4: //sat
            basemapURL = [NSURL URLWithString:@"http://services.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer"];
            break;
        default:
            break;
    }
    
    //remove existing basemap layer
    [self.mapView removeMapLayerWithName:@"Basemap Tiled Layer"];
    
    //add new layer
    AGSTiledMapServiceLayer* newBasemapLayer = [AGSTiledMapServiceLayer tiledMapServiceLayerWithURL:basemapURL];
    [self.mapView insertMapLayer:newBasemapLayer withName:@"Basemap Tiled Layer" atIndex:0];

}
@end

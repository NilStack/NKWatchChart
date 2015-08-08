//
//  InterfaceController.m
//  WatchChart Extension
//
//  Created by Peng on 8/6/15.
//  Copyright © 2015 Peng. All rights reserved.
//

#import "InterfaceController.h"
#import "ChartTableRowController.h"

@interface InterfaceController()

@property (weak, nonatomic) IBOutlet WKInterfaceTable *chartTable;
@property (strong, nonatomic) NSArray *chartTypes;

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    
    self.chartTypes = @[@"Line Chart", @"Bar Chart", @"Pie Chart", @"Circle Chart", @"Radar Chart"];
    [self.chartTable setNumberOfRows:self.chartTypes.count withRowType:@"ChartTableRowController"];
    
    [self.chartTypes enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        ChartTableRowController* row = [self.chartTable rowControllerAtIndex:idx];
        
        [row.chartType setText: (NSString*)obj];
        
    }];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (instancetype)contextForSegueWithIdentifier:(NSString *)segueIdentifier inTable:(WKInterfaceTable *)table rowIndex:(NSInteger)rowIndex
{
    return [self.chartTypes objectAtIndex:rowIndex];
}

@end




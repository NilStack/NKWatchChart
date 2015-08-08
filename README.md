#NKWatchChart#
A chart library for Apple Watch based on [PNChart](https://github.com/kevinzhow/PNChart).

![gif](https://db.tt/d7pJD84m)


##Examples##
We support line, bar, pie, circle and radar charts.

####Line Chart####

![Line Chart](https://db.tt/XjrGEkMM)

```objective-c
    
    NKLineChart *chart = [[NKLineChart alloc] initWithFrame:frame];
        chart.yLabelFormat = @"%1.1f";
        [chart setXLabels:@[@"SEP 1",@"SEP 2",@"SEP 3",@"SEP 4",@"SEP 5",@"SEP 6",@"SEP 7"]];
        chart.showCoordinateAxis = YES;
        
        //Use yFixedValueMax and yFixedValueMin to Fix the Max and Min Y Value
        //Only if you needed
        chart.yFixedValueMax = 300.0;
        chart.yFixedValueMin = 0.0;
       
        [chart setYLabels:@[
                            @"0",
                            @"50",
                            @"100",
                            @"150",
                            @"200",
                            @"250",
                            @"300",
                            ]
         ];
        
        chart.yLabelFont = [UIFont systemFontOfSize:6.f];
        chart.xLabelFont = [UIFont systemFontOfSize:6.f];
        chart.xLabelWidth = 10.f;
        chart.yLabelColor = NKGreen;
        chart.xLabelColor = NKGreen;
        
        chart.axisColor = NKLightGrey;
        chart.axisWidth = 1.f;
        
        chart.xUnit = @"Day";
        chart.yUnit = @"Min";
        
        // Line Chart #1
        NSArray * data01Array = @[@60.1, @160.1, @126.4, @0.0, @186.2, @127.2, @176.2];
        NKLineChartData *data01 = [NKLineChartData new];
        data01.color = NKGreen;
        data01.alpha = 0.9f;
        data01.itemCount = data01Array.count;
        data01.inflexionPointStyle = NKLineChartPointStyleTriangle;
        data01.getData = ^(NSUInteger index) {
            CGFloat yValue = [data01Array[index] floatValue];
            return [NKLineChartDataItem dataItemWithY:yValue];
        };
        
        // Line Chart #2
        NSArray * data02Array = @[@0.0, @180.1, @26.4, @202.2, @126.2, @167.2, @276.2];
        NKLineChartData *data02 = [NKLineChartData new];
        data02.color = NKTwitterColor;
        data02.alpha = 0.5f;
        data02.itemCount = data02Array.count;
        data02.inflexionPointStyle = NKLineChartPointStyleCircle;
        data02.getData = ^(NSUInteger index) {
            CGFloat yValue = [data02Array[index] floatValue];
            return [NKLineChartDataItem dataItemWithY:yValue];
        };
        
        
    chart.chartData = @[data01,data02];
        
    image = [chart drawImage];
    [self.chartImage setImage:image];

```

####Bar Chart####

![Bar Chart](https://db.tt/MfvNnpOp)

####Pie Chart####

![Pie Chart](https://db.tt/hs3MwXxW)

####Circle Chart####

![Circle Chart](https://db.tt/bmRpg3ep)

####Radar Chart####

![Radar Chart](https://db.tt/FgQer9TW)

##Requirements##
* watchOS ~> 2.0
* Xcode >= 7.0


##License##
This code is distributed under the terms and conditions of the MIT license.
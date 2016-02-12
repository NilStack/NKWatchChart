#NKWatchChart#

![Verision](https://img.shields.io/badge/pod-v0.1.0-blue.svg)
![Platform](https://img.shields.io/badge/platform-watchOS-ff69b4.svg)
![License](https://img.shields.io/badge/license-MIT-blue.svg)

A chart library for Apple Watch based on [PNChart](https://github.com/kevinzhow/PNChart). We support line, bar, pie, circle and radar charts now and will integrate more chart types from [ios-charts](https://github.com/danielgindi/ios-charts).

![gif](https://db.tt/d7pJD84m)

##Usage##

###CocoaPods###
In your watchOS target

    pod 'NKWatchChart'

Then

    pod install

And

    #import "NKWatchChart.h"

[Using CocoaPods with watchOS 2](https://medium.com/@JTEhlert/using-cocoapods-with-watchos-2-723b92eae04f) by Justin Ehlert

###Copy NKWatchChart folder to watch app extension ###

##Requirements##
* watchOS ~> 2.0
* Xcode >= 7.0

##Examples##

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

```objective-c

     NKBarChart *chart = [[NKBarChart alloc] initWithFrame:frame];
        chart.yLabelFormatter = ^(CGFloat yValue){
            CGFloat yValueParsed = yValue;
            NSString * labelText = [NSString stringWithFormat:@"%0.f",yValueParsed];
            return labelText;
        };
        chart.labelMarginTop = 5.0;
        chart.showChartBorder = YES;
        [chart setXLabels:@[@"2",@"3",@"4",@"5",@"2",@"3",@"4",@"5"]];
        //       self.barChart.yLabels = @[@-10,@0,@10];
        [chart setYValues:@[@10.82,@1.88,@6.96,@33.93,@10.82,@1.88,@6.96,@33.93]];
        [chart setStrokeColors:@[NKGreen,NKGreen,NKRed,NKGreen,NKGreen,NKGreen,NKRed,NKGreen]];

        image = [chart drawImage];
        [self.chartImage setImage:image];

```

####Pie Chart####

![Pie Chart](https://db.tt/hs3MwXxW)

```objective-c

     NSArray *items = @[[NKPieChartDataItem dataItemWithValue:10 color:NKLightGreen],
                           [NKPieChartDataItem dataItemWithValue:20 color:NKFreshGreen description:@"WWDC"],
                           [NKPieChartDataItem dataItemWithValue:40 color:NKDeepGreen description:@"GOOG I/O"],
                           ];

        NKPieChart *chart = [[NKPieChart alloc] initWithFrame:frame items:items];
        chart.descriptionTextColor = [UIColor whiteColor];
        chart.descriptionTextFont  = [UIFont systemFontOfSize:12.0];
        chart.showAbsoluteValues = NO;
        chart.showOnlyValues = NO;

        image = [chart drawImage];
        [self.chartImage setImage:image];

```

####Circle Chart####

![Circle Chart](https://db.tt/bmRpg3ep)

```objective-c

    UIColor *shadowColor = [UIColor colorWithRed:225.0 / 255.0 green:225.0 / 255.0 blue:225.0 / 255.0 alpha:0.5f];
        NKCircleChart *chart = [[NKCircleChart alloc] initWithFrame:frame total:@100 current:@60 clockwise:YES shadow:YES shadowColor:shadowColor displayCountingLabel:YES overrideLineWidth:@5];
        chart.strokeColor = NKGreen;
        chart.strokeColorGradientStart = NKLightGreen;
        image = [chart drawImage];
        [self.chartImage setImage:image];

```

####Radar Chart####

![Radar Chart](https://db.tt/FgQer9TW)

```objective-c

    NSArray *items = @[[NKRadarChartDataItem dataItemWithValue:3 description:@"Art"],
                           [NKRadarChartDataItem dataItemWithValue:2 description:@"Math"],
                           [NKRadarChartDataItem dataItemWithValue:8 description:@"Sports"],
                           [NKRadarChartDataItem dataItemWithValue:5 description:@"Liter"],
                           [NKRadarChartDataItem dataItemWithValue:4 description:@"Other"],
                           ];
        NKRadarChart *chart = [[NKRadarChart alloc] initWithFrame:frame items:items valueDivider:1];

        image = [chart drawImage];
        [self.chartImage setImage:image];

```
##TODO##
* more testing
* refactoring
* add bubble chart from [ios-charts](https://github.com/danielgindi/ios-charts)
* add scatter chart
* more chart types

##Apps using NKWatchChart##

Please Let me know at guoleii@gmail.com if you use NKWatchChart in your apps.

##NKWatchChart on medias##

 * maniacdev.com

[https://maniacdev.com/2015/08/open-source-library-for-drawing-charts-on-the-apple-watch](https://maniacdev.com/2015/08/open-source-library-for-drawing-charts-on-the-apple-watch)

 * watchkitresources.com

[http://watchkitresources.com/issues/9](http://watchkitresources.com/issues/9)

 * iphonedev.co.kr in Korean

[http://iphonedev.co.kr/sampleSource/24204](http://iphonedev.co.kr/sampleSource/24204)

 * toutiao.io in Chinese

[http://toutiao.io/posts/qga8e](http://toutiao.io/posts/qga8e)

##License##
This code is distributed under the terms and conditions of the MIT license.

##Thanks##
Awesome chart library [PNChart](https://github.com/kevinzhow/PNChart) by @kevinzhow

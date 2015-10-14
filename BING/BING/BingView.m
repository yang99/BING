//
//  BingView.m
//  BING
//
//  Created by yangyao on 15/10/8.
//  Copyright © 2015年 yangyao. All rights reserved.
//


#define PI 3.14159265358979323846
#define radius 100
#import "BingView.h"

@implementation BingView
//核心函数是:CGContextAddArc(CGContextRef c, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, int clockwise)
//
//* CGContextRef:图形上下文
//* x,y: 开始画的坐标
//* radius: 半径
//* startAngle, endAngle: 开始的弧度,结束的弧度
//* clockwise: 画的方向(顺时针,逆时针)
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

static inline float radians(double degrees)
{
    return degrees * PI / 180;
}

/**
 *  关键函数
 *
 *  @param ctx         图形上下文
 *  @param point       开始画的坐标
 *  @param angle_start 开始的弧度
 *  @param angle_end   结束的弧度
 *  @param color       填充颜色
 *
 *  @return ok
 */
static inline void drawArc(CGContextRef ctx, CGPoint point, float angle_start, float angle_end, UIColor* color) {
    CGContextMoveToPoint(ctx, point.x, point.y);
    CGContextSetFillColor(ctx, CGColorGetComponents( [color CGColor]));
    CGContextAddArc(ctx, point.x, point.y, radius,  angle_start, angle_end, 0);
//    CGContextClosePath(ctx);
    CGContextFillPath(ctx);
}

- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextClearRect(ctx, rect);

    float angle_start = radians(0.0);
    float angle_end = radians(121.0);
    drawArc(ctx, self.center, angle_start, angle_end, [UIColor yellowColor]);
    
    angle_start = angle_end;
    angle_end = radians(228.0);
    drawArc(ctx, self.center, angle_start, angle_end, [UIColor greenColor]);
    
    angle_start = angle_end;
    angle_end = radians(260);
    drawArc(ctx, self.center, angle_start, angle_end, [UIColor orangeColor]);
    
    angle_start = angle_end;
    angle_end = radians(360);
    drawArc(ctx, self.center, angle_start, angle_end, [UIColor purpleColor]);
}
@end

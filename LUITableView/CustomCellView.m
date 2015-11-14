//
//  CustomCellView.m
//  IBeacon demo
//
//  Created by zhoumao on 15/11/10.
//  Copyright © 2015年 sensoro. All rights reserved.
//

#import "CustomCellView.h"

//*******************************************************************************
//这里CustomView类 也可以新建一个类 再引入头文件回来
//*******************************************************************************

@implementation CustomCellView
@synthesize model = _model;
@synthesize str = _str;

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //*******************************************************************************
        //设置 背景透明或其他颜色，不然多次重绘时之前绘制的内容都还在，会叠加到一块儿
        //*******************************************************************************
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect{
    //*******************************************************************************
    //绘制Cell内容，NSString UIImage 等有drawInRect或者drawAtPoint 方法的都可以在这里绘制
    //*******************************************************************************
    [[UIColor redColor] set];
    
    //绘制一张图片
    UIImage *image = [UIImage imageNamed:@"duck.png"];
    //[image drawAtPoint:CGPointMake(5, 5)];
    [image drawInRect:CGRectMake(5, 5, 50, 50)];
    
    //绘制一个字符串 drawInRect: 在某个区域内 withFont: 以什么字体
    [_model drawInRect:CGRectMake(60, 5, 200, 30) withFont:[UIFont systemFontOfSize:24]];
    
    [_str  drawInRect:CGRectMake(200, 5, 320, 30) withFont:[UIFont systemFontOfSize:10]];
    
    [[UIColor greenColor] set];
    //绘制图形
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIGraphicsPushContext(context);
    CGContextBeginPath(context);
    //*******************************************************************************
    //这之间的内容决定你画的是什么图形
    //    CGContextAddArc(context, 70, 40, 10, 0.0, 2*M_PI, NO);// (70, 40)为圆心 10 是半径
    //这之间的内容决定你画的是什么图形
    //*******************************************************************************
    CGContextFillPath(context);
    UIGraphicsPopContext();
    //*******************************************************************************
    //根据需要，你可以在这里绘制Cell内容来定制你的cell
    //那些不需要响应点击等事件的元素都可以绘制到CustomView上
    //需要响应点击事件等的UIView，如UIButton则需要addSubview到cell.contentView上
    //*******************************************************************************
}

- (void)setModel:(NSString *)model{
    _model = model;
    //这里setNeedsDisplay 重绘自己
    [self setNeedsDisplay];
}

- (void)setStr:(NSString *)str{
    _str = str;
    [self setNeedsDisplay];
}
@end

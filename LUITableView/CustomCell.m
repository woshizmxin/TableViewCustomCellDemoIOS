//
//  CustomCell.m
//  LUITableView
//
//  Created by OranWu on 13-1-5.
//  Copyright (c) 2013年 Oran Wu. All rights reserved.
//

#import "CustomCell.h"
#import "CustomCellView.h"

@interface CustomCell() {
    CustomCellView *cView;
}
@end
@implementation CustomCell
@synthesize model = _model;
@synthesize str = _str;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [cView removeFromSuperview];
        //*******************************************************************************
        //实例化 cView 并添加到 cell的contentView 上
        //那些不需要响应点击等事件的元素都可以绘制到CustomView上
        //需要响应点击事件等的UIView，如UIButton则需要addSubview到self.contentView上
        //*******************************************************************************
        cView = [[CustomCellView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, [CustomCell cellHeight])];
        [self.contentView addSubview:cView];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

- (void)setModel:(NSString *)model{
    _model = model;
    //*******************************************************************************
    //设置cView 的model属性， 由于CustomView 实现了- (void)setModel:(NSString *)model; 同时也会调用这个方法
    //*******************************************************************************
    cView.model = _model;
}

- (void)setStr:(NSString *)str{
    _str = str;
    cView.str = _str;
}

+ (float)cellHeight{
    return 60;//如果你需要高度随内容变化的cell，在这里返回高度计算结果
}


@end

//
//  SSListCell.m
//  TableViewScrollSmoothDemo
//
//  Created by penghe on 2018/1/12.
//  Copyright © 2016年 WondersEducation. All rights reserved.
//

#import "SSListCell.h"
#import <SDWebImage/SDWebImageDecoder.h>

@implementation UIImage (CircleImage)

- (UIImage *)drawCircleImage {
    CGFloat side = MIN(self.size.width, self.size.height);
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(side, side), false, [UIScreen mainScreen].scale);
    CGContextAddPath(UIGraphicsGetCurrentContext(),
                     [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, side, side)].CGPath);
    CGContextClip(UIGraphicsGetCurrentContext());
    CGFloat marginX = -(self.size.width - side) / 2.f;
    CGFloat marginY = -(self.size.height - side) / 2.f;
    [self drawInRect:CGRectMake(marginX, marginY, self.size.width, self.size.height)];
    CGContextDrawPath(UIGraphicsGetCurrentContext(), kCGPathFillStroke);
    UIImage *output = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return output;
}


@end

@interface SSListCell ()
@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;
@property (weak, nonatomic) IBOutlet UILabel *desLabel;

@end

#pragma mark - Constants Define


@implementation SSListCell

#pragma mark - Properties Getter And Setter


#pragma mark - Lifecycle

/*
 - (instancetype)initWithFrame:(CGRect)frame {
 if ((self = [super initWithFrame:frame]))
 {
 //...
 }
 return self;
 }
 */

/*
 - (instancetype)initWithCoder:(NSCoder *)decoder {
 if ((self = [super initWithCoder:decoder]))
 {
 //...
 }
 return self;
 }
 */

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setupViews];
    
}

- (void)dealloc
{
}

#pragma mark - Setup

- (void)setupViews
{
    //    self.logoImageView.layer.cornerRadius = 20;
    self.logoImageView.layer.masksToBounds = YES;
    
    self.desLabel.layer.cornerRadius = 11;
    self.desLabel.layer.backgroundColor = [UIColor colorWithRed:225/225 green:40/225 blue:225/225 alpha:1].CGColor;
    self.logoImageView.layer.backgroundColor = [UIColor whiteColor].CGColor;

    
   
}

#pragma mark - Layout

/*
 - (void)layoutSubviews
 {
 [super layoutSubviews];
 }
 */

#pragma mark - Drawing

/*
 - (void)drawRect:(CGRect)rect
 {
 
 }
 */

#pragma mark - Actions

- (void)configCell
{
//    UIImage *image = [[UIImage imageNamed:@"logo"] drawCircleImage];
//    self.logoImageView.image = image;
    
        //在需要圆角时调用如下
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    
            //加载并缓存到内存，如果内存不存在就去图片管理文件夹里加载，可能在任何时候会被清理（未被使用的）。如果只使用一次不用系统缓存的可以用 imageWithContentsOfFile，可以减小内存压力。清理的时机可能是应用在后台或者内存紧张的时候系统会清理。
    
    
            UIImage *image = [UIImage imageNamed:@"logo"];
    
            //imageWithContentsOfFile 加载会立刻解码。imageNamed不会只有显示时候解码，所以显示之前异步解码
            UIImage *returnImg = [[UIImage decodedImageWithImage:image] drawCircleImage];
    
//            UIImage *returnImg = [[UIImage imageNamed:@"logo"] drawCircleImage];

            dispatch_async(dispatch_get_main_queue(), ^{
                self.logoImageView.image = returnImg;
            });
        });
}

#pragma mark - Notification

#pragma mark - KVO

#pragma mark - Delegate And DataSource Protocol

@end



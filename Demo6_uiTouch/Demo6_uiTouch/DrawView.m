//
//  DrawView.m
//  Demo6_uiTouch
//
//  Created by  江苏 on 16/2/29.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "DrawView.h"
@implementation DrawView
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    UIBezierPath* path=[UIBezierPath bezierPath];
    NSValue* value=[self.points firstObject];
    CGPoint point=[value CGPointValue];
    [path moveToPoint:point];
    for(NSValue *value in self.points) {
        point=[value CGPointValue];
        [path addLineToPoint:point];
    }
    path.lineWidth=4;
    [[UIColor redColor]setStroke];
    [path stroke];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //UITouch* touch=[touches anyObject];
    //CGPoint point=[touch locationInView:self];
    self.points=[[NSMutableArray alloc]init];
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch=[touches anyObject];
    CGPoint point=[touch locationInView:self];
    NSValue* value=[NSValue valueWithCGPoint:point];
    [self.points addObject:value];
    [self setNeedsDisplay];
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"Touch结束了");
}
@end

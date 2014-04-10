//
//  BorderButton.m
//  Pods
//
//  Created by Frank Michael on 4/10/14.
//
//

#import "BorderButton.h"

@interface BorderButton () {
    CAShapeLayer *circleLayer;
    UIColor *borderColor;
}
- (void)setupButton;
@end

@implementation BorderButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setupButton];
    }
    return self;
}
- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self){
        [self setupButton];
    }
    return self;
}
- (void)setupButton{
    borderColor = self.titleLabel.textColor;
    circleLayer = [CAShapeLayer layer];
    circleLayer.bounds = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    circleLayer.position = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    UIBezierPath *path;
    if (self.frame.size.width == self.frame.size.height){
        path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
    }else {
        path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:8];
    }
    circleLayer.path = path.CGPath;
    path = nil;
    circleLayer.strokeColor = borderColor.CGColor;
    circleLayer.lineWidth = 2.0f;
    circleLayer.fillColor = nil;
    [[self layer] insertSublayer:circleLayer below:self.titleLabel.layer];
}
- (void)setHighlighted:(BOOL)highlighted{
    if (highlighted){
        circleLayer.fillColor = borderColor.CGColor;
        self.titleLabel.textColor = [UIColor whiteColor];
    }else{
        self.titleLabel.textColor = borderColor;
        circleLayer.fillColor = nil;
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

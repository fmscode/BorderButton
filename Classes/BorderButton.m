//
//  BorderButton.m
//  Pods
//
//  Created by Frank Michael on 4/10/14.
//
//

#import "BorderButton.h"

@interface BorderButton ()

    @property CAShapeLayer *circleLayer;
    @property UIColor *borderColor;

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
    _borderColor = self.titleLabel.textColor;
    self.tintColor = _borderColor;
    
    self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 4);
    self.titleEdgeInsets = UIEdgeInsetsMake(0, 4, 0, 0);
    
    if (!_circleLayer)
    {
        _circleLayer = [CAShapeLayer layer];
        [[self layer] insertSublayer:_circleLayer below:self.imageView.layer];
    }
    
    _circleLayer.bounds = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    _circleLayer.position = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    UIBezierPath *path;
    if (self.frame.size.width == self.frame.size.height){
        path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
    }else {
        path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:8];
    }
    _circleLayer.path = path.CGPath;
    path = nil;
    _circleLayer.strokeColor = _borderColor.CGColor;
    _circleLayer.lineWidth = 2.0f;
    _circleLayer.fillColor = nil;
}
- (void)setHighlighted:(BOOL)highlighted{
    if (highlighted) {
        self.tintColor = [UIColor whiteColor];
        _circleLayer.fillColor = _borderColor.CGColor;
        self.titleLabel.textColor = [UIColor whiteColor];
    } else {
        self.titleLabel.textColor = _borderColor;
        _circleLayer.fillColor = nil;
        self.tintColor = _borderColor;
    }
}
- (void)setTitleColor:(UIColor *)color forState:(UIControlState)state{
    [super setTitleColor:color forState:state];
    
    if (state == UIControlStateNormal)
    {
        _borderColor = color;
    }
    
    self.tintColor = _borderColor;
    
    _circleLayer.strokeColor = _borderColor.CGColor;
}

- (void)setEnabled:(BOOL)enabled
{
    [super setEnabled:enabled];
    
    [self setupButton];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self setupButton];
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

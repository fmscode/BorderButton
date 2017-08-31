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
    if (!_circleLayer) {
        // NOTE: These rows are to prevent breaking prior functionality, in lieu of prior explicit `UIControlStateHighlighted` color definition. (was overridden in code)
        
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted | UIControlStateSelected];
        ////
        
        _circleLayer = [CAShapeLayer layer];
        _circleLayer.strokeColor=[[self titleColorForState:UIControlStateNormal] CGColor];
    }
    
    _circleLayer.bounds = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    _circleLayer.position = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    UIBezierPath *path;
    if (self.frame.size.width == self.frame.size.height){
        path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
    } else {
        path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:8];
    }
    _circleLayer.path = path.CGPath;
    path = nil;
    [self setBorderWidth:_borderWidth];
    [self configureButtonInversion];
    [[self layer] insertSublayer:_circleLayer below:self.titleLabel.layer];
}

- (void)configureButtonInversion {
    [_circleLayer setFillColor:(([self state]==UIControlStateSelected || [self state]==UIControlStateHighlighted || [self state]==(UIControlStateHighlighted | UIControlStateSelected)) ? _circleLayer.strokeColor : nil)];
}

- (void)setHighlighted:(BOOL)highlighted {
    // [super setHighlighted:highlighted]; // NOTE: Calling super() here breaks functionality.
    [self configureButtonInversion];
}

- (void)setBorderWidth:(CGFloat)borderWidth
{
    _borderWidth=borderWidth;
    _circleLayer.lineWidth = (_borderWidth ?: 2.0f);
    
}

- (void)setTitleColor:(UIColor *)color forState:(UIControlState)state {
    [super setTitleColor:color forState:state];
    ////
    
    if (state==UIControlStateNormal) {
        _circleLayer.strokeColor = color.CGColor;
        [self configureButtonInversion];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self setupButton];
}

@end

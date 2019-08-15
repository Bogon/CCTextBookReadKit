//
//  CCBRKMagnifierView.m
//  CCBRKMagnifierView
//
//  Created by mac on 2019/8/15.
//

#import "CCBRKMagnifierView.h"

/// 动画时间
#define CCBRK_MV_AD_TIME 0.08

/// 放大比例
#define CCBRK_MV_SCALE 1.3

/// 放大区域
#define CCBRK_MV_WH 120

@interface CCBRKMagnifierView ()

@property (nonatomic, strong) CCBRKMagnifierView *strongSelf;

@property (nonatomic, weak) CALayer *contentLayer;

@property (nonatomic, weak) UIImageView *coverOne;

@property (nonatomic, weak) UIImageView *coverTwo;

@end

@implementation CCBRKMagnifierView

+ (instancetype)magnifierView {
    
    CCBRKMagnifierView *mv = [[CCBRKMagnifierView alloc] init];
    
    mv.strongSelf = mv;
    
    return mv;
}

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) { }
    
    return self;
}

- (id)init {
    
    self = [super init];
    
    if (self) {
        
        self.offsetPoint = CGPointMake(0, -40);
        self.scale = CCBRK_MV_SCALE;
        
        self.frame = CGRectMake(0, 0, CCBRK_MV_WH, CCBRK_MV_WH);
        self.layer.cornerRadius = CCBRK_MV_WH / 2;
        self.layer.masksToBounds = YES;
        self.windowLevel = UIWindowLevelAlert;
        
        CALayer *contentLayer = [CALayer layer];
        contentLayer.frame = self.bounds;
        contentLayer.delegate = self;
        contentLayer.contentsScale = [[UIScreen mainScreen] scale];
        [self.layer addSublayer:contentLayer];
        self.contentLayer = contentLayer;
        
        self.transform = CGAffineTransformMakeScale(0.5, 0.5);
        
        UIImageView *coverOne = [[UIImageView alloc] init];
        coverOne.image = [UIImage imageNamed:@"magnifier_0"];
        coverOne.frame = CGRectMake(0, 0, CCBRK_MV_WH, CCBRK_MV_WH);
        [self addSubview: coverOne];
        self.coverOne = coverOne;
        
        UIImageView *coverTwo = [[UIImageView alloc] init];
        coverTwo.image = [UIImage imageNamed:@"magnifier_1"];
        coverTwo.frame = CGRectMake(0, 0, CCBRK_MV_WH, CCBRK_MV_WH);
        [self addSubview:coverTwo];
        self.coverTwo = coverTwo;
    }
    
    return self;
}

- (void)setoffsetPoint:(CGPoint)offsetPoint {
    
    _offsetPoint = offsetPoint;
    
    [self setTargetPoint:self.targetPoint];
}

- (void)setScale:(CGFloat)scale {
    
    _scale = scale;
    
    [self.contentLayer setNeedsDisplay];
}

- (void)setTargetWindow:(UIView *)targetWindow {
    
    _targetWindow = targetWindow;
    
    [self makeKeyAndVisible];
    
    __weak CCBRKMagnifierView *weakSelf = self;
    
    [UIView animateWithDuration:CCBRK_MV_AD_TIME animations:^{
        
        weakSelf.transform = CGAffineTransformMakeScale(1.0, 1.0);
    }];
    
    [self setTargetPoint:self.targetPoint];
}

- (void)setTargetPoint:(CGPoint)targetPoint {
    
    _targetPoint = targetPoint;
    
    if (self.targetWindow) {
        
        CGPoint center = CGPointMake(targetPoint.x, self.center.y);
        
        if (targetPoint.y > CGRectGetHeight(self.bounds) * 0.5) {
            
            center.y = targetPoint.y -  CGRectGetHeight(self.bounds) / 2;
        }
        
        self.center = CGPointMake(center.x + self.offsetPoint.x, center.y + self.offsetPoint.y);
        
        [self.contentLayer setNeedsDisplay];
    }
}

- (void)remove:(void (^)(void))complete {
    
    __weak CCBRKMagnifierView *weakSelf = self;
    
    [UIView animateWithDuration:CCBRK_MV_AD_TIME animations:^{
        
        weakSelf.coverOne.alpha = 0;
        
        weakSelf.coverTwo.alpha = 0;
        
        weakSelf.alpha = 0;
        
        weakSelf.transform = CGAffineTransformMakeScale(0.2, 0.2);
        
    } completion:^(BOOL finished) {
        
        [weakSelf.coverOne removeFromSuperview];
        
        [weakSelf.coverTwo removeFromSuperview];
        
        [weakSelf removeFromSuperview];
        
        weakSelf.strongSelf = nil;
        
        if (complete != nil) { complete(); }
    }];
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    CGContextTranslateCTM(ctx, CCBRK_MV_WH / 2, CCBRK_MV_WH / 2);
    
    CGContextScaleCTM(ctx, self.scale, self.scale);
    
    CGContextTranslateCTM(ctx, -1 * self.targetPoint.x, -1 * self.targetPoint.y);
    
    [self.targetWindow.layer renderInContext:ctx];
}

- (void)dealloc
{
    [self.contentLayer removeFromSuperlayer];
    
    self.contentLayer = nil;
}

@end

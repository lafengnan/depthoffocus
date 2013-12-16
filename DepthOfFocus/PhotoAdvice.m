//
//  photoAdvice.m
//  DepthOfFocus
//
//  Created by lafengnan on 12-8-27.
//  Copyright (c) 2012年 lafengnan. All rights reserved.
//

#import "PhotoAdvice.h"

@implementation PhotoAdvice



- (id)init
{
    self = [super init];
    if (self) {

        NSString *advice1 = @"阳光16法则";
        NSString *advice2 = @"相机抖动法则";
        NSString *advice3 = @"18%灰度测光法则";
        NSString *advice4 = @"景深法则";
        NSString *advice5 = @"闪光距离法则";
        NSString *advice6 = @"日落测光法则";
        NSString *advice7 = @"月光11，8和5.6法则";
        NSString *advice8 = @"动态捕捉法则";
        
        advicesTable = [[NSArray alloc]initWithObjects:advice1, advice2,
                        advice3,advice4, advice5, advice6, advice7,advice8, nil];
        
        NSString *advice1Detail = @"阳光十六阴天八,多云十一日暮四。乌云压顶五点六，雪天落雨同日暮。室内球场二秒足，客厅戏台快门八。"
        "即在拍摄处于明媚均匀阳光下的主体时，快门定为感光度的倒数，光圈设为F16为宜。以此为基准，可以估算出在海滩用F22光圈，有云的晴天用F11等。";
        NSString *advice2Detail = @"安全的快门速度是焦距的倒数。如，使用50mm的镜头时，如果手持拍摄，快门速度至少要1/60以上为宜(当然，防抖镜头不算)。"
        "如果低于此快门速度，请使用闪光灯，三脚架，或为相机找其他支撑物。";
        NSString *advice3Detail = @"用18%中灰板测光会带来最好的效果。如果没有灰板，可以将手掌摊开面向阳光，对手掌测光读数，然后加一档曝光。(不同肤色)"
        "对成像效果的影响差异几乎连一档都达不到。";
        NSString *advice4Detail = @"对焦点取在整个景深的前1/3处可以得到最大的景深。因为焦点后的景深是焦点前的2倍。";
        NSString *advice5Detail = @"距离x2，感光度x4。比如，qq聊天室闪光灯在感光度100时有效距离为20英尺，如果你想要闪光距离达到40英尺，则需要使用400感光度。";
        NSString *advice6Detail = @"拍摄日落时，要对落日上部测光，但取景器中不要取到太阳。如果想让照片上的日落看上去比实际晚一小时，可以在曝光补偿中减1。";
        NSString *advice7Detail = @"拍摄月亮的曝光组合有多种，但最为人乐于使用的是11、8和5.6组合。当快门速度为感光度倒数时，满月用F11光圈，半月和3/4月用F8和F5.6光圈。";
        NSString *advice8Detail = @"这是一个角度与速度的经验公式。如果物体沿镜头的轴线活动，你能够用1/125的快门捕捉下来，那么它垂直于镜头轴线的运动(从取景框的一边到另一边的活动)能用比1/125高2档的快门速度(1/500)捕捉下来，如果物体沿镜头轴线成45度活动，只需要进一档快门(1/250)就能捕捉下来。";
        
        for (int i = 0; i < 8; i++) {
            flags[i] = false;
        }
        adviceDetailsTable = [[NSArray alloc]initWithObjects:advice1Detail, advice2Detail, advice3Detail,
                              advice4Detail, advice5Detail, advice6Detail, advice7Detail, advice8Detail, nil];
        
        [advice1 release];
        [advice2 release];
        [advice3 release];
        [advice4 release];
        [advice5 release];
        [advice6 release];
        [advice7 release];
        [advice8 release];
        [advice1Detail release];
        
    }
    
    return self;
}

+ (PhotoAdvice *)adviceStore
{
    static PhotoAdvice *defaultPhotoAdvice = nil;
    
    if (!defaultPhotoAdvice) {
        defaultPhotoAdvice = [[PhotoAdvice alloc]init];
    }
    
    return defaultPhotoAdvice;
}

- (NSArray *)allAdvices
{
    return advicesTable;
}

- (NSArray *)allAdviceDetails
{
    return adviceDetailsTable;
}
- (void)setAdviceFlag:(BOOL)selceted AtIndex:(NSInteger)index
{
    flags[index] = selceted;
}
- (void)resetAdviceFlags
{
    for (int i = 0; i < 8; i++) {
        flags[i] = false;
    }
}
- (BOOL *)allFlags
{
    return flags;
}
@end

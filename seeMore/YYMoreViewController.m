//
//  YYMoreViewController.m
//  YYKitDemo
//
//  Created by zhangrongwu on 2018/5/21.
//  Copyright © 2018年 ibireme. All rights reserved.
//

#import "YYMoreViewController.h"
#import "YYKit.h"
@interface YYMoreViewController ()
@property (nonatomic, strong)YYLabel *label;
@end

@implementation YYMoreViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    NSMutableAttributedString *text = [NSMutableAttributedString new];

    //添加文本
    NSString *title =@"先帝创业未半而中道崩殂(cú)，今天下三分，益州疲(pí)弊，此诚危急存亡之秋也。然侍卫之臣不懈(xiè)于内，忠志之士忘身于外者，盖追先帝之殊遇，欲报之于陛下也。诚宜开张圣听，以光先帝遗(yí)德，恢弘志士之气，不宜妄自菲薄，引喻失义，以塞(sè)忠谏之路也。\n宫中府中，俱为一体，陟(zhì )罚臧(zāng)否(pǐ)，不宜异同。若有作奸犯科及为忠善者，宜付有司论其刑赏，以昭陛下平明之理，不宜偏私，使内外异法也。\n侍中、侍郎郭攸(yōu)之、费祎(yī)、董允等，此皆良实，志虑忠纯，是以先帝简拔以遗(wèi)陛下。愚以为宫中之事，事无大小，悉以咨之，然后施行，必能裨(bì)补阙漏，有所广益。\n将军向宠，性行（xíng）淑均，晓畅军事，试用于昔日，先帝称之曰能，是以众议举宠为督。愚以为营中之事，悉以咨之，必能使行(háng )阵和睦，优劣得所。\n亲贤臣，远小人，此先汉所以兴隆也;亲小人，远贤臣，此后汉所以倾颓也。先帝在时，每与臣论此事，未尝不叹息痛恨于桓（huán）、灵也。侍中、尚书、长(zhǎng)史、参军，此悉贞良死节之臣，愿陛下亲之信之，则汉室之隆，可计日而待也。\n臣本布衣，躬耕于南阳，苟全性命于乱世，不求闻(wén)达于诸侯。先帝不以臣卑（bēi）鄙（bǐ），猥(wěi)自枉屈，三顾臣于草庐之中，咨臣以当世之事，由是感激，遂许先帝以驱驰。后值倾覆，受任于败军之际，奉命于危难之间,尔来二十有(yòu)一年矣! 【“有”是通假字，通“又”，跟在数词后面表示约数。所以读yòu】\n先帝知臣谨慎，故临崩寄臣以大事也。受命以来，夙(sù)夜忧叹，恐托付不效，以伤先帝之明，故五月渡（dù）泸，深入不毛。今南方已定，兵甲已足，当奖率三军，北定中原，庶(shù)竭驽(nú)钝，攘(rǎng)除奸凶，兴复汉室，还于旧都。此臣所以报先帝而忠陛下之职分也。至于斟酌损益，进尽忠言，则攸之、祎、允之任也。\n 愿陛下托臣以讨贼兴复之效，不效,则治臣之罪，以告先帝之灵。若无兴德之言，则责攸之、祎、允等之慢，以彰其咎(jiù)。陛下亦宜自谋，以咨诹(zōu)善道，察纳雅言，深追先帝遗诏。臣不胜受恩感激!";
    [text appendAttributedString:[[NSAttributedString alloc] initWithString:title attributes:nil]];
    text.font = [UIFont systemFontOfSize:16];
    
    _label = [YYLabel new];
    _label.userInteractionEnabled =YES;
    _label.numberOfLines =0;
    _label.textVerticalAlignment =YYTextVerticalAlignmentTop;
    _label.frame = CGRectMake(0,50, self.view.frame.size.width,300); // 默认高度需自行控制，币得 资讯模块文案预估高度
    _label.attributedText = text;
    [self.view addSubview:_label];
    
    _label.layer.borderWidth =0.5;
    _label.layer.borderColor = [UIColor cyanColor].CGColor;
    // 添加查看全部
    [self addAllButton];
}


- (void)addAllButton {
    __weak typeof (self) _self = self;
    // 需要拼接的内容
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"...全部"];
    // 高亮点击模块 运用在tableview中可和百度开源的FD结合使用自适应cell高度
    YYTextHighlight *hi = [YYTextHighlight new];
    [hi setColor:[UIColor colorWithRed:0.578 green:0.790 blue:1.000 alpha:1.000]];
    hi.tapAction = ^(UIView *containerView,NSAttributedString *text,NSRange range, CGRect rect) {
        YYLabel *label = _self.label;
        [label sizeToFit];
    };
    
    // 全部：文字高亮
    [text setColor:[UIColor colorWithRed:0.000 green:0.449 blue:1.000 alpha:1.000]range:[text.string rangeOfString:@"全部"]];
    [text setTextHighlight:hi range:[text.string rangeOfString:@"全部"]];
    text.font =_label.font;

    YYLabel *seeMore = [YYLabel new];
    seeMore.attributedText = text;
    [seeMore sizeToFit];
    // yylebel 添加到原label中
    NSAttributedString *truncationToken = [NSAttributedString attachmentStringWithContent:seeMore contentMode:UIViewContentModeCenter attachmentSize:seeMore.frame.size alignToFont:text.font alignment:YYTextVerticalAlignmentCenter];
    _label.truncationToken = truncationToken;
}

@end

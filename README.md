
文字末尾点击查看更多展开所有内容

通过yykit中的yylabel与富文本结合进行处理

```
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
```




![ACCA1CD7-EAC7-4EBD-B6E2-4789831C3C2E.png](https://upload-images.jianshu.io/upload_images/1775503-29875a03402c97eb.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![0340046E-EF48-4B95-8B50-69E405BB1AE0.png](https://upload-images.jianshu.io/upload_images/1775503-28e38b5d5d7dc51d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)



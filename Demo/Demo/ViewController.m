//
//  ViewController.m
//  Demo
//
//  Created by whbalzac on 27/02/2018.
//  Copyright © 2018 whbalzac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.minimumLineHeight = 24;
    style.alignment = NSTextAlignmentCenter;
    NSDictionary *attrs = @{ NSFontAttributeName : [UIFont systemFontOfSize:18],
                             NSForegroundColorAttributeName : [UIColor blackColor],
                             NSParagraphStyleAttributeName : style};
    
    NSString *text = @"春江花月夜\n[唐] 张若虚\n春江潮水连海平，海上明月共潮生。\n滟滟随波千万里，何处春江无月明！\n江流宛转绕芳甸，月照花林皆似霰。\n空里流霜不觉飞，汀上白沙看不见。\n江天一色无纤尘，皎皎空中孤月轮。\n江畔何人初见月？江月何年初照人？\n人生代代无穷已，江月年年望相似。\n不知江月待何人，但见长江送流水。\n白云一片去悠悠，青枫浦上不胜愁。\n谁家今夜扁舟子？何处相思明月楼？\n可怜楼上月徘徊，应照离人妆镜台。\n玉户帘中卷不去，捣衣砧上拂还来。\n此时相望不相闻，愿逐月华流照君。\n鸿雁长飞光不度，鱼龙潜跃水成文。\n昨夜闲潭梦落花，可怜春半不还家。\n江水流春去欲尽，江潭落月复西斜。\n斜月沉沉藏海雾，碣石潇湘无限路。\n不知乘月几人归，落月摇情满江树。";
    
    UILabel *label = [[UILabel alloc] initWithFrame:self.view.frame];
    label.attributedText = [[NSAttributedString alloc] initWithString:text attributes:attrs];
    label.center = self.view.center;
    label.numberOfLines = 0;
    [self.view addSubview:label];
    
    UIButton *button = [[UIButton alloc] init];
    button.frame = CGRectMake(16, CGRectGetMaxY(self.view.frame) - 44 - 16, 44, 44);
    [self.view addSubview:button];
    button.backgroundColor = [UIColor greenColor];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 22;
    
    [button addTarget:self action:@selector(presentChirldVC) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button1 = [[UIButton alloc] init];
    button1.frame = CGRectMake(CGRectGetWidth(self.view.frame) - 16 - 44, CGRectGetMaxY(self.view.frame) - 44 - 16, 44, 44);
    [self.view addSubview:button1];
    button1.backgroundColor = [UIColor greenColor];
    button1.layer.masksToBounds = YES;
    button1.layer.cornerRadius = 22;
    
    [button1 addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
}


- (void)presentChirldVC
{
    ViewController *vc = [[ViewController alloc] initWithType:kWHCustomAnimationTypePush];
    vc.view.backgroundColor = [UIColor orangeColor];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)dismiss
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

//
//  ViewController.m
//  KVO
//
//  Created by Luminous on 2020/11/6.
//

#import "ViewController.h"
#import "KVOPerson.h"

static void *PersonAgeContext = &PersonAgeContext;

@interface ViewController ()
/** <#注释#> */
@property (nonatomic, strong)  KVOPerson *p1;
@property (nonatomic, strong)  KVOPerson *p2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.p1 = [[KVOPerson alloc] init];
    self.p2 = [[KVOPerson alloc] init];
    self.p1.age = 1;
    self.p1.nickName = @"mike";

    self.p2.age = 2;

    // self 监听 p1 的 age 属性
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
	// context 相同keyPath不好区分 如p1.age和p2.age多个对象有相同keyPath
    // 这时可以使用 context = PersonAgeContext；更加便利安全
    [self.p1 addObserver:self forKeyPath:@"age" options:options context:NULL];
    [self.p1 addObserver:self forKeyPath:@"nickName" options:options context:NULL];

    [self.p2 addObserver:self forKeyPath:@"age" options:options context:PersonAgeContext ];

}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"监听到 %@ 的 %@ 改变了 %@", object, keyPath,change);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.p1.age = 10;
    [self.p1 willChangeValueForKey:@"nickName"];
    self.p1.nickName = @"nickName1";
    [self.p1 didChangeValueForKey:@"nickName"];
}
- (void)dealloc
{
    //合适地方观察一定要移除
    [self.p1 removeObserver:self forKeyPath:@"age"];
    [self.p1 removeObserver:self forKeyPath:@"nickName"];
    [self.p2 removeObserver:self forKeyPath:@"age"];

}

@end

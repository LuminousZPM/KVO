//
//  KVOPerson.m
//  KVO
//
//  Created by Luminous on 2020/11/6.
//

#import "KVOPerson.h"

@implementation KVOPerson
- (void)setAge:(int)age {
    if (age != _age) {
        [self willChangeValueForKey:@"age"];
        _age = age;
        [self didChangeValueForKey:@"age"];
    }
}
+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)theKey {
    BOOL automatic = NO;
//    if ([theKey isEqualToString:@"nickName"]) {
//        automatic = NO;
//    }
//    else {
//        automatic = [super automaticallyNotifiesObserversForKey:theKey];
//    }
    return automatic;
}
@end

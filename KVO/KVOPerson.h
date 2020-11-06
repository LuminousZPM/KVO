//
//  KVOPerson.h
//  KVO
//
//  Created by Luminous on 2020/11/6.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KVOPerson : NSObject
/** age */
@property (nonatomic, assign) int age;
/** name */
@property (nonatomic, strong) NSString *name;
/** nickName */
@property (nonatomic, strong) NSString *nickName;
@end

NS_ASSUME_NONNULL_END

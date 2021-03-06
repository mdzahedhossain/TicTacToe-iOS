//
// Created by Antoni Kędracki, Polidea
//

#import "Typhoon.h"
#import "PLAssembly.h"
#import "PLIPhoneRootViewController.h"
#import "PLGameManager.h"

@implementation PLAssembly {

}

- (id)iPhoneRootViewController {
    return [TyphoonDefinition withClass:[PLIPhoneRootViewController class]
                         initialization:^(TyphoonInitializer *initializer) {
                             initializer.selector = @selector(initWithGameManager:gameListController:);
                             [initializer injectWithDefinition:[self gameManager]];
                             [initializer injectWithDefinition:[self gameListViewController]];
                         }];
}

- (id)gameListViewController {
    return [TyphoonDefinition withClass:[PLGameListViewController class]
                         initialization:^(TyphoonInitializer *initializer) {
                             initializer.selector = @selector(initWithGameManager:);
                             [initializer injectWithDefinition:[self gameManager]];
                         }];
}

- (id)gameManager {
    return [TyphoonDefinition withClass:[PLGameManager class]
                         initialization:^(TyphoonInitializer *initializer) {
                             initializer.selector = @selector(init);
                         }
                             properties:^(TyphoonDefinition *definition) {
                                 definition.scope = TyphoonScopeSingleton;
                             }];
}

@end
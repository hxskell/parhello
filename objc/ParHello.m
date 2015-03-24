#import <Foundation/Foundation.h>

int main() {
  NSString *message = @"Hello World!";

  dispatch_queue_t queue = dispatch_get_global_queue(
                             DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
  dispatch_group_t group = dispatch_group_create();

  for (NSUInteger i = 0; i < [message length]; i++) {
    dispatch_group_async(group, queue, ^ {
      NSLog(@"%c", [message characterAtIndex:i]);
    });
  }

  dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
  dispatch_release(group);

  return 0;
}

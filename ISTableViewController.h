#import <UIKit/UIKit.h>

@interface ISTableViewController : UIViewController 
<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, assign) UITableViewStyle style;
@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) UIActivityIndicatorView *indicatorView;
@property (nonatomic, retain) NSMutableArray *array;
@property (nonatomic, retain) UILabel *messageLabel;

- (void)showLoadingIndicator;
- (void)hideLoadingIndicator;
- (void)showMessageLabel;

@end

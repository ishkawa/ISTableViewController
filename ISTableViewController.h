#import <UIKit/UIKit.h>

@interface ISTableViewController : UIViewController 
<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) UIActivityIndicatorView *indicatorView;
@property (nonatomic, retain) NSMutableArray *array;

@end

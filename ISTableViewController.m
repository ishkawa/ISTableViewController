#import "ISTableViewController.h"

@implementation ISTableViewController

@synthesize style = _style;
@synthesize tableView = _tableView;
@synthesize indicatorView = _indicatorView;
@synthesize array = _array;
@synthesize messageLabel = _messageLabel;

- (id)init
{
    self = [super init];
    if (self) {
        self.array = [NSMutableArray array];
        self.style = UITableViewStylePlain;
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    self.view.backgroundColor = [UIColor whiteColor];

    CGRect frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    self.tableView = [[[UITableView alloc] initWithFrame:frame style:self.style] autorelease];
    self.tableView.autoresizingMask = (UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight);
    [self.view addSubview:self.tableView];
    
    CGFloat unit = 20.f;
    self.indicatorView = [[[UIActivityIndicatorView alloc] init] autorelease];
    self.messageLabel.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleTopMargin);
    self.indicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    self.indicatorView.hidesWhenStopped = YES;
    self.indicatorView.frame = CGRectMake(self.view.frame.size.width/2.f - unit/2.f,
                                          self.view.frame.size.height/2.f - unit*2.f,
                                          unit, unit);
    [self.view addSubview:self.indicatorView];
    
    CGFloat width = 200.f;
    CGFloat height = 50.f;
    self.messageLabel = [[[UILabel alloc] init] autorelease];
    self.messageLabel.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleTopMargin);
    self.messageLabel.hidden = YES;
    self.messageLabel.textAlignment = UITextAlignmentCenter;
    self.messageLabel.textColor = [UIColor lightGrayColor];
    self.messageLabel.font = [UIFont systemFontOfSize:14];
    self.messageLabel.text = @"No Items";
    self.messageLabel.backgroundColor = [UIColor clearColor];
    self.messageLabel.frame = CGRectMake(self.view.frame.size.width/2.f - width/2.f,
                                         self.view.frame.size.height/2.f - 10,
                                         width, height);
    [self.tableView addSubview:self.messageLabel];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.delegate  = self;
    self.tableView.dataSource = self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}

- (void)dealloc
{
    [_tableView release], _tableView = nil;
    [_indicatorView release], _indicatorView = nil;
    [_array release], _array = nil;
    [super dealloc];
}

#pragma mark - action

- (void)showLoadingIndicator
{
    [self.indicatorView startAnimating];
    self.tableView.hidden = YES;
    self.messageLabel.hidden = YES;
}

- (void)hideLoadingIndicator
{
    [self.indicatorView stopAnimating];
    self.tableView.hidden = NO;
    self.messageLabel.hidden = YES;
}

- (void)showMessageLabel
{
    [self.indicatorView stopAnimating];
    self.messageLabel.hidden = NO;
}

#pragma mark - table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.array count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = nil;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier] autorelease];
    }
    return cell;
}

#pragma mark - table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end

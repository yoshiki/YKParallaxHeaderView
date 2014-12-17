import UIKit

class ViewController: UIViewController {
    @IBOutlet var tableView: UITableView?
    let headerViewHeight: CGFloat = 200.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        YKParallaxHeaderView(image: UIImage(named: "image.jpg")!, height: headerViewHeight, inView: tableView)
        tableView?.dataSource = self
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let CellIdentifier: String = "Cell"
        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(CellIdentifier) as? UITableViewCell
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: CellIdentifier)
        }
        
        cell?.textLabel?.text = "Row \(indexPath.row)"
        return cell!
    }
}
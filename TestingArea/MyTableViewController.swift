import UIKit

class MyTableViewController: UITableViewController {
    var cells: [[UITableViewCell]] = [[]]
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return cells.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells[section].count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return cells[indexPath.section][indexPath.row]
    }
    @IBAction func add(sender: UIBarButtonItem) {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Hi \(cells[0].endIndex)"
        addCellToSection(0, cell: cell)
    }
    
    @IBAction func remove(sender: UIBarButtonItem) {
        removeCellFromSection(0, index: cells[0].endIndex - 1)
    }
    
    func addCellToSection(section: Int, cell: UITableViewCell) {
        cells[section].append(cell)
        tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: cells[section].endIndex - 1, inSection: section)], withRowAnimation: .Left)
    }
    
    func removeCellFromSection(section: Int, index: Int) {
        cells[section].removeAtIndex(index)
        tableView.deleteRowsAtIndexPaths([NSIndexPath(forRow: index, inSection: section)], withRowAnimation: .Left)
    }
}

extension Array where Element : CollectionType,
Element.Generator.Element : Equatable, Element.Index == Int {
    func indicesOf(x: Element.Generator.Element) -> (Int, Int)? {
        for (i, row) in self.enumerate() {
            if let j = row.indexOf(x) {
                return (i, j)
            }
        }
        return nil
    }
}
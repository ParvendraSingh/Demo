

import UIKit
import SVProgressHUD

protocol TrendingProductsCustomDelegate: class {
    func sendDataBackToHomePageViewController(categoryToRefresh: String?)
}

class SecondViewController: UIViewController {
    var secondViewModel: SecondViewModel!
    weak var customDelegate: TrendingProductsCustomDelegate?

    var didSelectItem: ((_ item: String) -> Void)?
    
   @IBOutlet var tblView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        styleNavigationBar()
        self.secondViewModel = SecondViewModel()
 
        // For dictionary
//        SVProgressHUD.show()
//        self.secondViewModel.fetchDataWithDictionary(completion: {(success) in
//            if success == true {
//                DispatchQueue.main.async(execute: {
//                    self.tblView.reloadData()
//                })
//            }
//         SVProgressHUD.dismiss()
//        })
        
        
        //For codable
        SVProgressHUD.show()
        self.secondViewModel.fetchDataWithCodable(completion: {(success) in
            if success == true {
                DispatchQueue.main.async(execute: {
                    self.tblView.reloadData()
                })
            }
            SVProgressHUD.dismiss()
        })
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}

private typealias TableViewDataSource = SecondViewController
private typealias TableViewDelegate = SecondViewController

extension TableViewDataSource: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return self.secondViewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath)
        let lbl:UILabel = cell.viewWithTag(1) as! UILabel
        lbl.text = self.secondViewModel.titleForItemAtIndexPath(indexPath: indexPath)
        return cell
    }
}

extension TableViewDelegate: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let itemStr = self.secondViewModel.titleForItemAtIndexPath(indexPath: indexPath)
        customDelegate?.sendDataBackToHomePageViewController(categoryToRefresh: itemStr)
        self.navigationController?.popViewController(animated: true)
    }
}

private typealias ViewStylingHelpers = SecondViewController
private extension ViewStylingHelpers {
    func styleNavigationBar() {
        // style navigation bar here
    }
}


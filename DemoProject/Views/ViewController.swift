

import UIKit



class ViewController: UIViewController,TrendingProductsCustomDelegate {

   @IBOutlet var lbl: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func goToSecondController(){
        let secondViewController = storyboard!.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController //You can understand this right. Same as yours.
        secondViewController.customDelegate=self
        self.navigationController?.pushViewController(secondViewController, animated: true)
        //self.performSegue(withIdentifier: "goToSecond", sender: self)
    }
    
    func sendDataBackToHomePageViewController(categoryToRefresh: String?) { //Custom delegate function which was defined inside child class to get the data and do the other stuffs.
        if categoryToRefresh != nil {
            print("Got the data is \(String(describing: categoryToRefresh))")
        }
         lbl?.text = categoryToRefresh
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



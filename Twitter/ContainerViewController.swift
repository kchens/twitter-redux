//
//  ContainerViewController.swift
//  Twitter
//
//  Created by Kevin Chen on 10/7/15.
//  Copyright © 2015 Kevin Chen. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var menuContainerView: UIView!
    @IBOutlet weak var detailContainerView: UIView!
    
//    var viewControllers: [UIViewController] = [
//        TweetsViewController(),
//        TweetComposeViewController()
//    ]
    
    override func viewDidLayoutSubviews() {
        scrollView.setContentOffset(CGPoint(x: 80,y: 0), animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // View did appear vs/ viewDidLoa
        let tweetsNavigationController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("TweetsNavigationController") as UIViewController
        
        self.addChildViewController(tweetsNavigationController)
        tweetsNavigationController.view.frame = self.detailContainerView.bounds
        tweetsNavigationController.view.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        self.detailContainerView.addSubview(tweetsNavigationController.view)
        tweetsNavigationController.didMoveToParentViewController(self)

        // Do any additional setup after loading the view.
    }
    
//    func selectViewControllers(viewController: UIViewController) {
//        let tweetsNavigationController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("TweetsNavigationController") as UIViewController
//        
//        self.addChildViewController(viewController)
//        viewController.view.frame = self.detailContainerView.bounds
//        viewController.view.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
//        self.detailContainerView.addSubview(viewController.view)
//        viewController.didMoveToParentViewController(self)
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

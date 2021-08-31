//
//  BaziGoster
//  proBazi
//
//  Created by Mehmet Durmaz on 25.07.2018.
//  Copyright © 2018 Mehmet Durmaz. All rights reserved.
//

import UIKit

class BaziGoster: UIPageViewController, UIPageViewControllerDelegate {

    lazy var subViewControllers : [UIViewController] = {
        return [
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FourPillar") as! FourPillar,
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BHDPartOne") as! BHDPartOne,
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BHDPartTwo") as! BHDPartTwo
        ]
    }()
    
    //TODO: - Sayfa noktaları için nesne oluşturduk
    var pageControl = UIPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        self.delegate = self
        
        //TODO: - Sayfa noktaları eklettridik
        configurePageControl()
        
        let tabBarHeight = tabBarController?.tabBar.frame.size.height
        print(tabBarHeight ?? "not defined")
        
        if let firstViewController = subViewControllers.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    //TODO: - Sayfa noktalarını ayarladık
    func configurePageControl() {
        // The total number of pages that are available is based on how many available colors we have.
        pageControl = UIPageControl(frame: CGRect(x: 0,y: UIScreen.main.bounds.maxY - 85,width: UIScreen.main.bounds.width,height: 50))
        self.pageControl.numberOfPages = subViewControllers.count
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor.black
        self.pageControl.pageIndicatorTintColor = UIColor.black
        self.pageControl.currentPageIndicatorTintColor = UIColor.white
        self.view.addSubview(pageControl)
    }
    
}

//MARK: - PageView Veri Kaynağı
extension BaziGoster : UIPageViewControllerDataSource {
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return subViewControllers.count
    }
    
    //TODO: - Sayfa noktaları için geçiş verisi
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        self.pageControl.currentPage = subViewControllers.index(of: pageContentViewController)!
    }
    
    //TODO: - Sayfalar sonsuz döngü içinde gelecek
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = subViewControllers.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return subViewControllers.last
        }
        
        guard subViewControllers.count > previousIndex else {
            return nil
        }
        
        return subViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = subViewControllers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        
        guard subViewControllers.count != nextIndex else {
            return subViewControllers.first
        }
        
        guard subViewControllers.count > nextIndex else {
            return nil
        }
        
        return subViewControllers[nextIndex]
    }
}
/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */

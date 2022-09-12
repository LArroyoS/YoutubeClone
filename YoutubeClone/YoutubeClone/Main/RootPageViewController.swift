//
//  RootPageViewController.swift
//  YoutubeClone
//
//  Created by Learning on 12/09/22.
//

import UIKit

protocol RootPageProtocol : AnyObject{
    func currentPage(_ index: Int )
}

class RootPageViewController: UIPageViewController {

    var subViewContollers = [UIViewController]()
    var currentIndex : Int = 0
    weak var delegateRoot : RootPageProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        dataSource = self
        setupViewController()
    }
    
    private func setupViewController(){
        subViewContollers = [
            HomeViewController(),
            VideosViewController(),
            PlaylistViewController(),
            ChannelViewController(),
            AboutViewController(),
        ]
        _ = subViewContollers.enumerated().map({ $0.element.view.tag = $0.offset })
        setViewControllerFromIndex(index: 0, direction: .forward)
    }
    
    func setViewControllerFromIndex( index : Int, direction: NavigationDirection, animated : Bool = true ){
        setViewControllers([subViewContollers[index]], direction: direction, animated: animated)
    }

}

extension RootPageViewController : UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return subViewContollers.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index : Int = subViewContollers.firstIndex(of: viewController) ?? 0
        if (index <= 0) { return nil }
        return subViewContollers[index-1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index : Int = subViewContollers.firstIndex(of: viewController) ?? 0
        if (index >= subViewContollers.count-1) { return nil }
        return subViewContollers[index+1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        print("finished", finished)
        if let index = pageViewController.viewControllers?.first?.view.tag {
            currentIndex = index
            delegateRoot?.currentPage(index)
        }
    }
    
}

//
//  BaseViewController.swift
//  Fastiee
//
//  Created by Mu Yu on 6/25/22.
//

import UIKit

class BaseViewController: ViewController {
    
    // MARK: - Coordinators
    weak var appCoordinator: AppCoordinator?
    weak var homeCoordinator: HomeCoordinator?
    weak var workoutCoordinator: WorkoutCoordinator?
    weak var meCoordinator: MeCoordinator?
    
    private lazy var refreshControl = UIRefreshControl()
    
    init(appCoordinator: AppCoordinator? = nil,
         homeCoordinator: HomeCoordinator? = nil,
         workoutCoordinator: WorkoutCoordinator? = nil,
         meCoordinator: MeCoordinator? = nil) {
        super.init()
        self.appCoordinator = appCoordinator
        self.homeCoordinator = homeCoordinator
        self.workoutCoordinator = workoutCoordinator
        self.meCoordinator = meCoordinator
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - View Config
extension BaseViewController {
    
}

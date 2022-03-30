//
//  MainPageSideMenuNavigationController.swift
//  Dealing
//
//  Created by 이정우 on 2022/03/30.
//

import UIKit
import SideMenu

class MainPageSideMenuNavigationController: SideMenuNavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.leftSide = true
        self.presentationStyle = .viewSlideOutMenuIn
        self.statusBarEndAlpha = 0
        self.menuWidth = self.view.frame.width * 0.5
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

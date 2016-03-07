//
//  ContatctViewController.swift
//  PromiseKit-Test
//
//  Created by aziz omar boudi  on 3/4/16.
//  Copyright © 2016 jogabo. All rights reserved.
//

import UIKit

class ContatctViewController: UIViewController {

  @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()

      view.addSubview(scrollView)

        // Do any additional setup after loading the view.
    }

  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()

    scrollView.contentSize = CGSizeMake(375, 800)
  }


}

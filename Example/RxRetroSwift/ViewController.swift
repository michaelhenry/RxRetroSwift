//
//  ViewController.swift
//  RxRetroSwift
//
//  Created by Michael Henry Pantaleon on 12/26/2017.
//  Copyright (c) 2017 Michael Henry Pantaleon. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
  
  let disposeBag = DisposeBag()
  override func viewDidLoad() {
    super.viewDidLoad()
    
    DefaultAPIClient.shared.getUsers().subscribe(onNext: { e in
      print(e.value)
    })
    .disposed(by: disposeBag)
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}


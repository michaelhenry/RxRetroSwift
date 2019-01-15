//
//  ViewController.swift
//  RxRetroSwift
//
//  Created by Michael Henry Pantaleon on 12/26/2017.
//  Copyright (c) 2017 Michael Henry Pantaleon. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {
  
  private let disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let client = APIClient.shared
    // since it's an Observable, we just simply subscribe to it.
    client.fetchPosts()
      .subscribe(onNext: { result in
        if let posts = result.value {
          // iterate all posts.
          posts.forEach {
            print("title: \($0.title), body: \($0.body)")
          }
        }
      })
      .disposed(by: disposeBag)
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}


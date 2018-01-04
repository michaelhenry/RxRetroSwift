# RxRetroSwift

[![CI Status](https://travis-ci.org/michaelhenry/RxRetroSwift.svg?style=flat)](https://travis-ci.org/michaelhenry/RxRetroSwift)
[![Version](https://img.shields.io/cocoapods/v/RxRetroSwift.svg?style=flat)](http://cocoapods.org/pods/RxRetroSwift)
[![License](https://img.shields.io/cocoapods/l/RxRetroSwift.svg?style=flat)](http://cocoapods.org/pods/RxRetroSwift)
[![Platform](https://img.shields.io/cocoapods/p/RxRetroSwift.svg?style=flat)](http://cocoapods.org/pods/RxRetroSwift)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.


## Requirements


## Features
- Easy to use and simple
- Clean and Neat implementation
- Support different Networking library (Alamofire, NSURLSession)
- Flexible response error handling
- Simplify your rest client.


## TODO
- Unit and integration test (in progress)
- Add Example (in progress)
- Support different authentication method for your `URLRequest`.


## Installation

RxRetroSwift is not yet available through [CocoaPods](http://cocoapods.org). But once it become available, to install
it, simply add the following line to your Podfile:


```ruby
pod 'RxRetroSwift'
```

## Sample implementation

```swift
class DefaultAPIClient:APIClient {
  
  static var shared = DefaultAPIClient()
  
  var caller = DefaultRequestCaller.shared
  
  private init() {
    
    RequestModel.defaults.baseUrl = "https://jsonplaceholder.typicode.com"
  }
  
  func getUsers() -> Observable<Result<[User],ErrorModel>> {
    
    let endpoint = "users"
    let httpMethod = RequestModel.HttpMethod.get
    
    let request = RequestModel(
      httpMethod: httpMethod,
      endpoint: endpoint,
      query: nil,
      payload: nil,
      headers: nil)
      .asURLRequest()

    return caller.call(request)
  }
}
```

## Contributions

Just feel free to submit pull request or suggest anything that would be useful.


## Credits

This uses RxSwift, Alamofire, ObjectMapper and Other 3rd party libraries.


## Author

Michael Henry Pantaleon, me@iamkel.net

## License

RxRetroSwift is available under the MIT license. See the LICENSE file for more info.





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
- Unit and integration test (done)
- Add Example (done)
- Support different authentication method for your `URLRequest`.


## Installation

RxRetroSwift is not yet available through [CocoaPods](http://cocoapods.org). But once it become available, to install
it, simply add the following line to your Podfile:


```ruby
pod 'RxRetroSwift'
```

## Sample implementation

Using [JSONPlaceholder API](https://jsonplaceholder.typicode.com).
You can also check the [Sample Project](Example/)

```swift
class DefaultAPIClient:APIClient {
 
  static var shared = DefaultAPIClient()
  var caller = DefaultRequestCaller.shared
  
  private init() {
    
    RequestModel.defaults.baseUrl = "https://jsonplaceholder.typicode.com"
  }
  
  func getPosts() -> Observable<Result<[Post], ErrorModel>> {
    let request = RequestModel(
      httpMethod: .get,
      endpoint: "posts")
      .asURLRequest()
    
    return caller.call(request)
  }
  
  func getComments() -> Observable<Result<[Comment], ErrorModel>> {
    let request = RequestModel(
      httpMethod: .get,
      endpoint: "comments")
      .asURLRequest()
    
    return caller.call(request)
  }
  
  func getAlbums() -> Observable<Result<[Album], ErrorModel>> {
    let request = RequestModel(
      httpMethod: .get,
      endpoint: "albums")
      .asURLRequest()
    
    return caller.call(request)
  }
  
  func getPhotos() -> Observable<Result<[Photo], ErrorModel>> {
    let request = RequestModel(
      httpMethod: .get,
      endpoint: "photos")
      .asURLRequest()
    
    return caller.call(request)
  }
  
  func getTodos() -> Observable<Result<[Todo], ErrorModel>> {
    let request = RequestModel(
      httpMethod: .get,
      endpoint: "todos")
      .asURLRequest()
    
    return caller.call(request)
  }
  
  func getUsers() -> Observable<Result<[User],ErrorModel>> {
    
    let request = RequestModel(
      httpMethod: .get,
      endpoint: "users")
      .asURLRequest()

    return caller.call(request)
  }
}
```


## Testing


```swift

class TestAPIClient:QuickSpec {
  
  override func spec() {
    
    describe("Using JSONPlaceholder API") {
      
      let apiClient = DefaultAPIClient.shared
      
      it("Check Posts result count"){
        let observable = apiClient.getPosts()
        expect(observable.map { $0.value!.count }).first == 100
      }
      
      it("Check Comments result count"){
        let observable = apiClient.getComments()
        expect(observable.map { $0.value!.count }).first == 500
      }
      
      it("Check Albums result count"){
        let observable = apiClient.getAlbums()
        expect(observable.map { $0.value!.count }).first == 100
      }
      
      it("Check Photos result count"){
        let observable = apiClient.getPhotos()
        expect(observable.map { $0.value!.count }).first == 5000
      }
      
      it("Check Todos result count"){
        let observable = apiClient.getTodos()
        expect(observable.map { $0.value!.count }).first == 200
      }
      
      it("Check Users result count"){
        let observable = apiClient.getUsers()
        expect(observable.map { $0.value!.count }).first == 10
      }
    }
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





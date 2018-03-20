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
- Flexible response error handling
- Simplify your rest API client.


## TODO
- Unit and integration test (done)
- Add Example (done)
- Support different authentication method for your `URLRequest`.


## Installation

RxRetroSwift is now available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:


```ruby
pod 'RxRetroSwift'
```

## Sample implementation

Using [JSONPlaceholder API](https://jsonplaceholder.typicode.com).
You can also check the [Sample Project](Example/)

```swift
class APIClient {
 
  static var shared = APIClient()
  var caller = RequestCaller.shared
  
  private init() {
    
    RequestModel.defaults.baseUrl = "https://jsonplaceholder.typicode.com"
  }
  
  func fetchPosts() -> Observable<Result<[Post], ErrorModel>> {
    let request = RequestModel(
      httpMethod: .get,
      path: "posts")
      .asURLRequest()
    
    return caller.call(request)
  }
  
  func insertPost(post:Post) -> Observable<Result<Post, ErrorModel>> {
    let request = RequestModel(
      httpMethod: .post,
      path: "posts",
      payload: post.dictionaryValue)
      .asURLRequest()
    
    return caller.call(request)
  }

  func fetchComments() -> Observable<Result<[Comment], ErrorModel>> {
    let request = RequestModel(
      httpMethod: .get,
      path: "comments")
      .asURLRequest()
    
    return caller.call(request)
  }
  
  func fetchAlbums() -> Observable<Result<[Album], ErrorModel>> {
    let request = RequestModel(
      httpMethod: .get,
      path: "albums")
      .asURLRequest()
    
    return caller.call(request)
  }
  
  func fetchPhotos() -> Observable<Result<[Photo], ErrorModel>> {
    let request = RequestModel(
      httpMethod: .get,
      path: "photos")
      .asURLRequest()
    
    return caller.call(request)
  }
  
  func fetchTodos() -> Observable<Result<[Todo], ErrorModel>> {
    let request = RequestModel(
      httpMethod: .get,
      path: "todos")
      .asURLRequest()
    
    return caller.call(request)
  }
  
  func fetchUsers() -> Observable<Result<[User],ErrorModel>> {
    
    let request = RequestModel(
      httpMethod: .get,
      path: "users")
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
      
      let apiClient = APIClient.shared
      
      it("Check Posts result count"){
        let observable = apiClient.fetchPosts()
        expect(observable.map { $0.value!.count }).first == 100
      }
      
      it("Can insert post"){
        var post = Post()
        let title = "This is my post"
        let userId = 101
        let body = "This is a message body"
        
        post.title = title
        post.userId = userId
        post.body = body
        let observable = apiClient.insertPost(post: post)
        expect(observable.map { $0.value?.title ?? "" }).first == title
        expect(observable.map { $0.value?.userId ?? 0 }).first == userId
        expect(observable.map { $0.value?.body ?? "" }).first == body
      }
      
      it("Check Comments result count"){
        let observable = apiClient.fetchComments()
        expect(observable.map { $0.value!.count }).first == 500
      }
      
      it("Check Albums result count"){
        let observable = apiClient.fetchAlbums()
        expect(observable.map { $0.value!.count }).first == 100
      }
      
      it("Check Photos result count"){
        let observable = apiClient.fetchPhotos()
        expect(observable.map { $0.value!.count }).first == 5000
      }
      
      it("Check Todos result count"){
        let observable = apiClient.fetchTodos()
        expect(observable.map { $0.value!.count }).first == 200
      }
      
      it("Check Users result count"){
        let observable = apiClient.fetchUsers()
        expect(observable.map { $0.value!.count }).first == 10
      }
    }
  }
}
```


## Contributions

Just feel free to submit pull request or suggest anything that would be useful.


## Credits

Starting v2.0, This library requires **RxSwift** for its reactive functionality.


## Author

Michael Henry Pantaleon, me@iamkel.net

## License

RxRetroSwift is available under the MIT license. See the LICENSE file for more info.





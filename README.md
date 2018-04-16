# RxRetroSwift

[![CI Status](https://travis-ci.org/michaelhenry/RxRetroSwift.svg?style=flat)](https://travis-ci.org/michaelhenry/RxRetroSwift)
[![Version](https://img.shields.io/cocoapods/v/RxRetroSwift.svg?style=flat)](http://cocoapods.org/pods/RxRetroSwift)
[![License](https://img.shields.io/cocoapods/l/RxRetroSwift.svg?style=flat)](http://cocoapods.org/pods/RxRetroSwift)
[![Platform](https://img.shields.io/cocoapods/p/RxRetroSwift.svg?style=flat)](http://cocoapods.org/pods/RxRetroSwift)


## What does it do?

It simplifies your **RESTful API** calls, automatically convert the `HttpResponse` into specified Model as well as the Error using the new apple ’s [Codable](https://developer.apple.com/documentation/swift/codable) feature.

For example in a request for fetching specific user information and you have a `User` model, all you have to do is make the User model conforms to [Codable](https://developer.apple.com/documentation/swift/codable) and specify it when using the [RequestCaller](Sources/Services/RequestCaller.swift).

```json
{
  "name":"kel",
  "email":"me@iamkel.net"
}
```

**`User` model that conforms to Codable.**
```Swift
struct User: Codable {
  var name:String
  var email:String
}
```

**This will automatically convert the response into an instance `User` model.**

Example:
```Swift

let caller = RequestCaller(config: URLSessionConfiguration.default)

func fetchUser(byUserId userId) -> Observable<Result<User, ErrorModel>> {
    let request:URLRequest = RequestModel(
      httpMethod: .get,
      path: "v1/users/\(userId)")
      .asURLRequest()
    return caller.call(request)
  }
```

**Let say it’s an array of users; since Array conforms to Codable, all you have to do is specify the type to be `[User]`.**

Example:
```Swift
func fetchUsers() -> Observable<Result<[User], ErrorModel>> {
    let request:URLRequest = RequestModel(
      httpMethod: .get,
      path: "v1/users")
      .asURLRequest()
    return caller.call(request)
  }
```

About handling ResponseError:

**RxRetroSwift** provided a typealias **ErrorCodable** which is a combination of [HasErrorInfo](Sources/Protocols/HasErrorInfo.swift) and [Decodable](https://developer.apple.com/documentation/swift/decodable) protocol:

```Swift
public typealias DecodableError = Decodable & HasErrorInfo
```

For example, the json error response of your login request is

```Swift
{
  "message": "Unable to login."
  "details": {
    "password": "You changed your password 2 months ago."
  }
}
```

And you have this as Model:
```Swift
struct ErrorModel {

  var errorCode:Int?
  var message:String
  var details:[String:String]
}
```

How about dealing to a request that don't expect to return an object or model?

**RxRetroSwift** provide a method that will return Observable<Result<[RawResponse](Sources/RxRetroSwift/Models/RawResponse.swift)>, DecodableErrorModel>>.

```swift

public func call<DecodableErrorModel:DecodableError>(_ request: URLRequest)
  -> Observable<Result<RawResponse, DecodableErrorModel>>
```

```swift

public struct RawResponse {
  
  public var statusCode:Int
  public var data:Data?
  
  init(statusCode:Int, data:Data?) {
    self.statusCode = statusCode
    self.data       = data
  }
}
```

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.


## Requirements

- [RxSwift](https://github.com/ReactiveX/RxSwift)

## Features
- Easy to use and simple, Just few lines of codes (excluding **RxSwift**).
- Clean and Neat implementation.
- Flexible error handling.
- Simplify your rest API client.

## TODO
- Unit and integration test (done)
- Add Example (done)
- Support different authentication method for your `URLRequest`.


## Installation

#### Cocoapods
RxRetroSwift is now available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:


```ruby
pod 'RxRetroSwift'
```
#### Swift Package Manager

```
.package(url: "https://github.com/michaelhenry/RxRetroSwift", from: "2.1"),
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


## Author

Michael Henry Pantaleon, me@iamkel.net

## License

RxRetroSwift is available under the MIT license. See the LICENSE file for more info.





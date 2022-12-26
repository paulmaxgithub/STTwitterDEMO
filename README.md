# Combine with MVVM for UIKit / SwiftUI 
## A practical example project with fetching tweet

<img src="/TwitterDemoApp.png" width="550">

This is refactoring another Combine tutorial which you can find here on the youtube cannel of Lets build that app:
LINK: https://youtu.be/OOpScVcXS10

What is used in the demo:
- use MVVM to prevent the massive ViewController problem
- integrate the STTwitter API with Combine by using Future publishers for ad-hoc callbacks
- write functions that create publishers with AnyPublisher and eraseToAnyPublisher
- create data streams with Decode and Catch errors
- use CurrentValueSubject and @Published to pass values into data streams
- write a complex data stream to fetch tweets with SwitchToLatest
- use resource management tools in Combine like debounce and removeDuplicates 

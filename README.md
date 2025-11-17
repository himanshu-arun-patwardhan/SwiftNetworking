# SwiftNetworking

SwiftNetworking is a Swift library aimed at simplifying and streamlining network operations in Swift-based iOS apps. It is a lightweight, flexible, and testable networking layer. It provides a clean and modern API for making HTTP(S) requests, handling responses, working with REST APIs, and managing network tasks with ease. It provides a protocol-driven approach (`NetworkRequestProtocol`) and a reusable generic client (`NetworkRequestManager`) to execute API with modern Swift concurrency (async/await).


## Features

- 🚀 **Simple API**: Make network calls with minimal setup and code.
- 🛠️ **REST and Custom Requests**: Easily work with RESTful services and customize requests for different HTTP methods (`GET, POST, PUT, DELETE`) and headers. Default headers (`Content-Type` of `application/json`, `Authorization` of `Bearer <token>`) and configurable headers like `form-data`, `form-urlencoded`
- ✨ **Response Handling**: Built-in parsing for common response types (JSON, Data) and custom decoders.
- ❌ **Built-in Error Handling**: `NetworkRequestError` has built-in error handling for wide range of common errors.
- 🏁 **State handling**: `NetworkRequestState` enum provides cases to handle different API request states- idle, loading, success, failure.
- 🧵 **Asynchronous and Thread-safe**: Modern Swift concurrency support with async/await.


## Installation

Install SwiftNetworking using the Swift Package Manager (SPM):

```swift
// In your Package.swift:
.package(url: "https://github.com/himanshu-arun-patwardhan/SwiftNetworking.git", from: "1.0.1")
```

Or add it to your project using Xcode:

1. Go to **File > Swift Packages > Add Package Dependency...**
2. Enter: `https://github.com/himanshu-arun-patwardhan/SwiftNetworking.git`
3. Follow the prompts to select the latest version.


## Contributing

Contributions are welcome! Please open an issue or submit a pull request for features, bug fixes, or enhancements. Before submitting, ensure your code is well-tested and follows the code style.


## Contact

For questions, issues, or support, open a GitHub issue or contact [Himanshu Arun Patwardhan](https://github.com/himanshu-arun-patwardhan).

---

Happy Networking! 🚀

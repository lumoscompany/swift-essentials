//
//  Created by Adam Stragner
//

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

/// Availble on WIndows / Linux / Darwin
/// https://github.com/swiftlang/swift-foundation/blob/main/Sources/FoundationEssentials/Data/Data.swift
public typealias Data = Foundation.Data

/// Availble on WIndows / Linux / Darwin
/// https://github.com/swiftlang/swift-foundation/blob/main/Sources/FoundationEssentials/Data/ContiguousBytes.swift
public typealias ContiguousBytes = Foundation.ContiguousBytes

/// Availble on WIndows / Linux / Darwin
/// https://github.com/swiftlang/swift-foundation/blob/main/Sources/FoundationEssentials/Error/CocoaError.swift#L190
public typealias LocalizedError = Foundation.LocalizedError

/// Availble on WIndows / Linux / Darwin
/// https://github.com/swiftlang/swift-foundation/blob/main/Sources/FoundationEssentials/URL/URL.swift
public typealias URL = Foundation.URL

/// Availble on WIndows / Linux / Darwin
/// https://github.com/swiftlang/swift-foundation/blob/main/Sources/FoundationEssentials/URL/URLComponents.swift
public typealias URLComponents = Foundation.URLComponents

/// Availble on WIndows / Linux / Darwin
/// https://github.com/swiftlang/swift-foundation/blob/main/Sources/FoundationEssentials/URL/URLComponents.swift
public typealias URLQueryItem = Foundation.URLQueryItem

/// Availble on WIndows / Linux / Darwin
/// https://github.com/swiftlang/swift-foundation/blob/main/Sources/FoundationEssentials/Date.swift#L29
public typealias Date = Foundation.Date

/// Availble on WIndows / Linux / Darwin
/// https://github.com/swiftlang/swift-foundation/blob/main/Sources/FoundationEssentials/Date.swift#L29
public typealias TimeInterval = Foundation.TimeInterval

/// Availble on WIndows / Linux / Darwin
/// https://github.com/apple/swift-corelibs-libdispatch
public typealias DispatchQueue = Foundation.DispatchQueue

/// Availble on WIndows / Linux / Darwin
/// https://github.com/swiftlang/swift-foundation/blob/main/Sources/FoundationEssentials/FileManager/SwiftFileManager.swift
public typealias FileManager = Foundation.FileManager

/// Availble on WIndows / Linux / Darwin
/// https://github.com/swiftlang/swift-foundation/blob/main/Sources/FoundationEssentials/JSON/JSONDecoder.swift
public typealias JSONDecoder = Foundation.JSONDecoder

/// Availble on WIndows / Linux / Darwin
/// https://github.com/swiftlang/swift-foundation/blob/main/Sources/FoundationEssentials/JSON/JSONEncoder.swift
public typealias JSONEncoder = Foundation.JSONEncoder

/// Availble on WIndows / Linux / Darwin
/// https://github.com/swiftlang/swift-foundation/blob/main/Sources/FoundationEssentials/UUID.swift#L19
public typealias UUID = Foundation.UUID

#if canImport(FoundationNetworking)
/// Availble on WIndows / Linux
// https://github.com/swiftlang/swift-corelibs-foundation/blob/main/Sources/FoundationNetworking/URLSession/URLSession.swift
public typealias URLSession = FoundationNetworking.URLSession

/// Availble on WIndows / Linux
/// https://github.com/swiftlang/swift-corelibs-foundation/blob/main/Sources/FoundationNetworking/URLResponse.swift
public typealias URLResponse = FoundationNetworking.URLResponse
public typealias HTTPURLResponse = FoundationNetworking.HTTPURLResponse

/// Availble on WIndows / Linux
/// https://github.com/swiftlang/swift-corelibs-foundation/blob/main/Sources/FoundationNetworking/URLRequest.swift
public typealias URLRequest = FoundationNetworking.URLRequest
#else
public typealias URLSession = Foundation.URLSession

public typealias URLResponse = Foundation.URLResponse
public typealias HTTPURLResponse = Foundation.HTTPURLResponse

public typealias URLRequest = Foundation.URLRequest
#endif

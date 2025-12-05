// The Swift Programming Language
// https://docs.swift.org/swift-book
//
// Swift Argument Parser
// https://swiftpackageindex.com/apple/swift-argument-parser/documentation

import ArgumentParser

@main
struct TestCli: ParsableCommand {
   @Flag
   var cool = false

   mutating func run() throws {
      print("Hello, world!")
   }
}

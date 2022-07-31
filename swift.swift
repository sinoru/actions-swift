#!/usr/bin/env swift
import Foundation

var process = Process()
process.executableURL = URL(fileURLWithPath: "/usr/bin/env")
process.arguments = ["swift"] + ProcessInfo.processInfo.arguments

let standardOutputPipe = Pipe()
standardOutputPipe.fileHandleForReading.readabilityHandler = { fileHandle in
    let data = fileHandle.availableData

    try! FileHandle.standardOutput.write(contentsOf: data)
}
process.standardOutput = standardOutputPipe

let standardErrorPipe = Pipe()
standardErrorPipe.fileHandleForReading.readabilityHandler = { fileHandle in
    let data = fileHandle.availableData

    try! FileHandle.standardError.write(contentsOf: data)
}
process.standardError = standardErrorPipe

try! process.run()
process.waitUntilExit()

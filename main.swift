//
//  main.swift
//  Traducciones
//
//  Created by Enrique on 14/3/24.
//

import Foundation

let workingDirectory = "/Users/trainingym/Documents/Projects/Traducciones" //Ruta del directorio del proyecto
let scriptPath = "FileManagerScript.sh"

let task = Process()

task.launchPath = "/bin/bash"
task.arguments = [scriptPath]
task.currentDirectoryPath = workingDirectory

let pipe = Pipe()

task.standardOutput = pipe
task.standardError = pipe
task.launch()

let data = pipe.fileHandleForReading.readDataToEndOfFile()

if let output = String(data: data, encoding: .utf8) {
    print(output)
}

task.waitUntilExit()

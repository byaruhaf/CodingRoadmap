import Foundation

var path = "/Users/alphabo/temp/CodingRoadmap/"
var src = "/Users/alphabo/temp/CodingRoadmap/src/"
var dest = "/Users/alphabo/temp/"



let fm = FileManager.default
var fileURLs: [String] = []

do {
    let items = try fm.contentsOfDirectory(atPath: path)
    
    for item in items {
        print("Found \(item)")
    }
} catch {
    // failed to read directory – bad permissions, perhaps?
}

let s = fm.subpaths(atPath: src)

print(s!)

//for i in s! {
//  do {
//      try fm.copyItem(atPath: src + i, toPath: dest + i)
//  } catch (let error) {
//      print("Cannot copy item at \(src) to \(dest): \(error)")
//  }    
//}

//if let dirContents = FileManager.default.enumerator(atPath: src) {
//  
//  for i in dirContents {
//      print(i)
//  }
//}

let srcUrl = URL(string: "file://" + src + "0/0.txt")!
let destUrl = URL(string: "file://" + dest)!

do {
    try fm.copyItem(at: destUrl, to: srcUrl)
} catch (let error) {
    print("Cannot copy item at \(src) to \(dest): \(error)")
}


//let directory = fm.temporaryDirectory
//print(directory.debugDescription)

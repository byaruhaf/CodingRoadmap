import Cocoa
import XCTest

//https://www.programmersought.com/article/25823992240/
//https://blog.spacepatroldelta.com/a?ID=00950-726e0635-7bfc-40a1-8efd-f63003a64761
//https://www.flawlessrhetoric.com/Railway-Route-Finder
//https://gitlab.com/FarrOut/dijkstra
//https://github.com/MadMouse/ThoughtWorks-Trains

var graph = AdjacencyListGraph<String>()

let a = graph.createVertex("A")
let b = graph.createVertex("B")
let c = graph.createVertex("C")
let d = graph.createVertex("D")
let e = graph.createVertex("E")

graph.addDirectedEdge(a, to: b, withWeight: 5)
graph.addDirectedEdge(b, to: c, withWeight: 4)
graph.addDirectedEdge(c, to: d, withWeight: 8)
graph.addDirectedEdge(d, to: c, withWeight: 8)
graph.addDirectedEdge(d, to: e, withWeight: 6)
graph.addDirectedEdge(a, to: d, withWeight: 5)
graph.addDirectedEdge(c, to: e, withWeight: 2)
graph.addDirectedEdge(e, to: b, withWeight: 3)
graph.addDirectedEdge(a, to: e, withWeight: 7)


//The distance of the route A-B-C.
graph.weightFrom(a, to: b)! +  graph.weightFrom(b, to: c)!

//The distance of the route A-D.
graph.weightFrom(a, to: d)

//The distance of the route A-D-C.
graph.weightFrom(a, to: d)! + graph.weightFrom(d, to: c)!

//The distance of the route A-E-B-C-D.
graph.weightFrom(a, to: e)! + graph.weightFrom(e, to: b)! + graph.weightFrom(b, to: c)! + graph.weightFrom(c, to: d)!

//The distance of the route A-E-D.
graph.weightFrom(a, to: e)
graph.weightFrom(e, to: d)

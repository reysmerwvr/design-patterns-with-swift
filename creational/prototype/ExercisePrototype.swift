import Foundation

class Point: CustomStringConvertible
{
  var x = 0
  var y = 0

  init() {}

  init(x: Int, y: Int)
  {
    self.x = x
    self.y = y
  }

  var description: String
  {
    return "(\(x),\(y))"
  }
}

class Line: CustomStringConvertible
{
  var start = Point()
  var end = Point()

  init(start: Point, end: Point)
  {
    self.start = start
    self.end = end
  }

  func deepCopy() -> Line
  {
    let newStart = Point(x: start.x, y: start.y)
    let newEnd = Point(x: end.x, y: end.y)
    return Line(start: newStart, end: newEnd)
  }

  var description: String
  {
    return "Start Point: \(start) End Point: \(end)"
  }
}

func main()
{
  var line1 = Line(start: Point(x: 5, y: 5), end: Point(x: 10, y: 10))
  print(line1)
  let line2 = line1.deepCopy()
  line1.start = Point(x: 0, y: 0)  // line1.start.x = 0 line1.start.y = 0
  line1.end = Point(x:1, y: 1) // line1.start.x = 1 line1.start.y = 1
  print(line1)
  print(line2)
}

main()
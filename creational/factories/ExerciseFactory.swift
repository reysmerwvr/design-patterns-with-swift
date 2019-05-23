import Foundation

class Person
{
  var id: Int
  var name: String

  init(called name: String, withId id: Int)
  {
    self.name = name
    self.id = id
  }

  public var description: String
  {
    return "Id: = \(id) - Name = \(name)"
  }
}

class PersonFactory
{
  private var id = 0

  func createPerson(name: String) -> Person
  {
    let p = Person(called: name, withId: id)
    id += 1
    return p
  }
}

func main() {
  let pf = PersonFactory()
  let p1 = pf.createPerson(name: "Reysmer")
  let p2 = pf.createPerson(name: "Williangel")
  print(p1.description)
  print(p2.description)
}

main()
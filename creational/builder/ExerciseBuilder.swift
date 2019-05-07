import Foundation

class CodeBuilder : CustomStringConvertible {
    private var ClassInstance = ClassBuilder()

    init(_ rootName: String)
    {
        ClassInstance.name = rootName
    }

    func addField(called name: String, ofType type: String) -> CodeBuilder
    {
        ClassInstance.fields.append(FieldBuilder(ofName: name, ofType: type))
        return self
    }

    public var description: String
    {
        return ClassInstance.description
    }
}

class ClassBuilder : CustomStringConvertible {
    var name = ""
    var fields = [FieldBuilder]()

    public var description: String {
        var codeStatement = "class \(name)\n{\n"
        for field in fields {
            codeStatement.append("   \(field)\n");
        }
        codeStatement.append("}\n")
        return codeStatement
    }
}

class FieldBuilder : CustomStringConvertible {
    private var name: String = ""
    private var type: String = ""

    init(ofName name: String, ofType type: String) {
        self.name = name
        self.type = type
    }

    public var description: String {
        return "var \(name): \(type)"
    }
}

func main()
{
  let cb = CodeBuilder("Person").addField(called: "name", ofType: "String").addField(called: "age", ofType: "Int")
  print(cb.description)
}

main()
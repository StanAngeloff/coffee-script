macro from: ->
  source: arguments[0][0].variable
  imports: arguments[0][0].args[0].args
  new AssignNode(arg, new ValueNode(source, [new AccessorNode(arg)])) for arg in imports

from_alias: from

obj: {
  method1: -> 'obj.method1'
  method2: -> 'obj.method2'
}

from obj use method1
from_alias obj use method2

ok method1() is obj.method1()
ok method2() is obj.method2()

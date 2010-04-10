macro from: ->
  args: Array::slice.call arguments
  throw new Error("'from' syntax is 'from Object use property1, property2, ...'") if not (args[0] instanceof CallNode)
  list: item.value for item in args[0].flatten() when item instanceof LiteralNode
  throw new Error("'from' needs an Object to import from.") if list.length < 1
  source: list.splice(0, 1)[0]
  throw new Error("'from' syntax is 'from $source use property1, property2, ...'") if list.splice(0, 1)[0] isnt 'use'
  throw new Error("'from' needs at least one property to import from '$source'") if list.length < 1
  new AssignNode(new ValueNode(literal(item)), new ValueNode(literal(source), [new AccessorNode(literal(item))])) for item in list

from_alias: from

obj: {
  method1: -> 'obj.method1'
  method2: -> 'obj.method2'
  property1: 'obj.property1'
}

from obj use method1, method2

ok method1() is obj.method1()
ok method2() is obj.method2()

from_alias obj use property1

ok property1 is obj.property1

from_alias: -> 'from_alias'
obj: -> 'obj'
use: -> 'use'

result: from_alias obj use method1
ok result is 'from_alias'

from_alias: from
second_alias: from_alias

obj: {
  method3: -> 'obj.method3'
  method4: -> 'obj.method4'
}

second_alias obj use method3
ok method3() is obj.method3()

from_alias: null

second_alias obj use method4
ok method4() is obj.method4()

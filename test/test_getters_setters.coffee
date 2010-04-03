# Getter and setter on object literal assignment
obj: {
  set value: (val) ->
    @val: '' + val + val
  get value: ( ->
    @val + @val
  )
}

obj.value: 'Hello!'
ok obj.value is 'Hello!Hello!Hello!Hello!'

# Setter only
obj: {
  set value: (val) -> @val: val
}

obj.value: 'Hello'
ok obj.value is undefined

# Getter only
obj: {
  get value: -> 1
}

ok obj.value is 1
throws -> obj.value: 2

# Getter and setter on class
class Obj
  constructor: ->
    @val: 0

  increment: ->
    @val: + 1

  set value: (val) ->
    @val: val

  get value: ->
    @val

obj: new Obj()
ok obj.value is 0 is obj.val
obj.increment(); obj.increment(); obj.increment()
ok obj.value is 3 is obj.val
obj.value: 10
ok obj.value is 10 is obj.val

# Setter only on class
class ObjSet
  set value: (value) ->
    @val: value

obj: new ObjSet()
obj.value: 10
ok obj.value is undefined

# Getter only on class
class ObjGet
  get value: -> 10

obj: new ObjGet()
ok obj.value is 10
throws -> obj.value: 3

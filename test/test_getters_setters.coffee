# Getters and setters
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


obj: {
  _value: []

  get value: -> @_value
  set value: (val) -> @_value: val

  one: (n) -> n.concat [n[-1] + 1]
  two: (n) -> n.concat [n[-1] + 2]
}

using one, two of obj

obj.value: [0] | one() | two()

puts inspect obj.value

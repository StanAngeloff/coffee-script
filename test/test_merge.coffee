base = {
  key:  'value'
  city: 'Sofia'
}

# Simple merge on its own
result = {}
result <<< base
deepEqual base, result

# Simple merge as part of an assignment
result  = {}
result = result <<< base
deepEqual base, result
deepEqual result, result

# Simple merge as the last expression in a code block
fn = ->
  result2 = {}
  result2 <<< base

result = fn()
deepEqual base, result

# Chained merges
base2 = { 'state': 'SF' }
result = {}
result <<< base2 <<< base
ok 'key' of base2 and 'city' of base2
ok 'state' of result
ok 'state' not of base

# Guarded merges
result = {}
base2 = { 'state': 'SF' }
result <<< (base2 <<< base) when (key) -> key in ['key', 'state']
ok 'key' of base2 and 'state' of result
ok 'city' not of result

result = {}
base2 = { 'state': 'SF' }
result <<< base2 <<< base when (key, value) -> value isnt 'Sofia'
ok 'key' of result and 'state' of result
ok 'city' not of result

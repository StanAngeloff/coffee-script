asc: [0..9]
desc: [9..0]
nested: [asc[...], desc[...]]

ok asc[-1] is 9
ok desc[-2] is 1
ok desc[- (1 + 1)] is 1

obj: {
    'asc': asc
    'desc': desc
    'nested': nested
}

ok obj.nested?[0]?[-1] is asc[-1]
ok obj?.nested?[- ( -> 1)()]?[-1] is desc[-1]

asc[-10..0]: desc[...]
deepEqual asc, obj.desc

asc: nested[0][...]
ok asc[- ( -> 10)()] is 0
ok asc[- 11] is undefined

counter: 0
fn: -> counter: + 1
obj?.nested?[- fn()]?[-1]?
ok counter is 1

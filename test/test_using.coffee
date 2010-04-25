obj: {

  method1: -> 'obj.method1'
  nested: {
    method2: -> 'obj.nested.method2'
    more: {
      method3: -> 'obj.nested.more.method3'
    }
  }
  'method-4': -> 'obj.method-4'
  method5: -> 'obj.method5'
}

name: -> 'method3'

using method1, nested.method2 of obj

ok method1() is obj.method1()
ok method2() is obj.nested.method2()

using nested.more[name()] as method3 of obj

ok method3() is obj.nested.more.method3()

using 'method-4' as method4, 'method5' of obj

ok method4() is obj['method-4']()
ok method5() is obj.method5()

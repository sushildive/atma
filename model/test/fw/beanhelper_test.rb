require 'test_helper'

class StubBean
  dsl_accessor :foo
  public :__myState
end

class XX
  dsl_accessor :doo
end

class BeanHelperTest < Minitest::Test
  def test_that_genEqlInitializeStateVariable
    sb = StubBean.new
    sb.foo=''
    assert_equal :@__myState, sb.instance_variables[0]
  end
  
  def test_that_attributeIsMaintainedInStateVariable
    sb = StubBean.new
    sb.foo='foo value'
    assert sb.__myState[:foo] != nil
  end

  def test_that_attributeHasAppropriateValueInitialized
    sb = StubBean.new
    sb.foo='foo value'
    assert sb.__myState[:foo].eql? sb.foo
  end
  
  def test_that_beanInstancesAreDifferent
    sb1=StubBean.new
    sb1.foo='kiran'
    sb2=StubBean.new
    sb2.foo='Kiran'
    assert sb1!=sb2, 'Objects were supposed to be different but appearing same'
    assert !(sb1.eql?sb2), 'Objects were supposed to be different but appearing same'
  end

  def test_that_beanInstancesAreSame
    sb1=StubBean.new
    sb1.foo='kiran'
    sb2=StubBean.new
    sb2.foo='kiran'
    assert sb1=(sb2), 'Objects were supposed to be equal but they are not'
    assert (sb1.eql?sb2), 'Objects were supposed to be equal but they are not'
    v=[]
    (1..10).each do |d|
      v[d]=XX.new
      v[d].doo=d
    end
  end
end
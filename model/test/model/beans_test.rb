# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require "test_helper"
class BeanTest < Minitest::Test
  def test_bank_requred_accessors_work_as_expected
    bank = Atma::Model::Bank.new
    bank.id_='bank id'
    bank.name_='bank name'
    bank.groupId_='group id'
    assert_equal 'bank id', bank.id_
    assert_equal 'bank name', bank.name_
    assert_equal 'group id', bank.groupId_
  end
  
  def test_bankInstanceEauality
    bank = Atma::Model::Bank.new
    bank.id_='bank id'
    bank.name_='bank name'
    bank.groupId_='group id'
    bank2 = Atma::Model::Bank.new
    bank2.id_='bank id'
    bank2.name_='bank name'
    bank2.groupId_='group id'
    assert_equal bank, bank2
  end
end
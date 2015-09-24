class Module
  def dsl_accessor(*symbols)
    class_eval %{
          def __myState
            @__myState
          end
          
          protected :__myState

          def eql? otherOne
            self.==(otherOne)
          end

          def == otherOne
            self.__myState== otherOne.__myState
          end
    }
    symbols.each do |sym|
      class_eval %{
                def #{sym}
                  @__myState||={}
                  @__myState[:#{sym}]
                end
                def #{sym}=(val)
                  @__myState||={}
                  @__myState[:#{sym}]=val
                end
      }
    end
  end
end

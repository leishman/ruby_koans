require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutInheritance < Neo::Koan
  class Dog
    attr_reader :name

    def initialize(name)
      @name = name
    end

    def bark
      "WOOF"
    end
  end

  class Chihuahua < Dog
    def wag
      :happy
    end

    def bark
      "yip"
    end
  end

  def test_subclasses_have_the_parent_as_an_ancestor
    assert_equal true, Chihuahua.ancestors.include?(Dog)
  end

  def test_all_classes_ultimately_inherit_from_object
    assert_equal true, Chihuahua.ancestors.include?(Object)
  end

  def test_subclasses_inherit_behavior_from_parent_class
    chico = Chihuahua.new("Chico")
    assert_equal "Chico", chico.name
  end
  # Note attr_reader names are accessible by a method automatically

  def test_subclasses_add_new_behavior
    chico = Chihuahua.new("Chico")
    assert_equal :happy, chico.wag

    assert_raise(NoMethodError) do
      fido = Dog.new("Fido")
      fido.wag
    end
  end

  def test_subclasses_can_modify_existing_behavior
    chico = Chihuahua.new("Chico")
    assert_equal "yip", chico.bark

    fido = Dog.new("Fido")
    assert_equal "WOOF", fido.bark
  end

  # Here the Chihuahua subclass overwrote the inherited Dog::bark method

  # ------------------------------------------------------------------

  class BullDog < Dog
    def bark
      super + ", GROWL"
    end
  end

  def test_subclasses_can_invoke_parent_behavior_via_super
    ralph = BullDog.new("Ralph")
    assert_equal "WOOF, GROWL", ralph.bark
  end

  # Super took the output of the inherited method and added more to it (this could be useful)

  # ------------------------------------------------------------------

  class GreatDane < Dog
    def growl
      super.bark + ", GROWL"
    end
  end

  def test_super_does_not_work_cross_method
    george = GreatDane.new("George")
    assert_raise(NoMethodError) do
      george.growl
    end
  end

end

require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutControlStatements < Neo::Koan

  def test_if_then_else_statements
    if true
      result = :true_value
    else
      result = :false_value
    end
    assert_equal :true_value, result
  end

  def test_if_then_statements
    result = :default_value
    if true
      result = :true_value
    end
    assert_equal :true_value, result
  end

  def test_if_statements_return_values
    value = if true
              :true_value
            else
              :false_value
            end
    assert_equal :true_value, value

    value = if false
              :true_value
            else
              :false_value
            end
    assert_equal :false_value, value

    # NOTE: Actually, EVERY statement in Ruby will return a value, not
    # just if statements.
  end

  def test_if_statements_with_no_else_with_false_condition_return_value
    value = if false
              :true_value
            end
    assert_equal nil, value
  end

  def test_condition_operators
    assert_equal :true_value, (true ? :true_value : :false_value)  
    assert_equal :false_value, (false ? :true_value : :false_value)
  end
  # Gotcha: same as saying ? is kind of like if and : is like else
  def test_if_statement_modifiers
    result = :default_value
    result = :true_value if true

    assert_equal :true_value, result
  end

  # Gotcha if can be used after a statement as well

  def test_unless_statement
    result = :default_value
    unless false    # same as saying 'if !false', which evaluates as 'if true'
      result = :false_value
    end
    assert_equal :false_value, result
  end

  def test_unless_statement_evaluate_true
    result = :default_value
    unless true    # same as saying 'if !true', which evaluates as 'if false'
      result = :true_value
    end
    assert_equal :default_value, result
  end

  def test_unless_statement_modifier
    result = :default_value
    result = :false_value unless false

    assert_equal :false_value, result
  end

  def test_while_statement
    i = 1
    result = 1
    while i <= 10
      result = result * i
      i += 1
    end
    assert_equal 3628800, result
  end

  def test_break_statement
    i = 1
    result = 1
    while true
      break unless i <= 10
      result = result * i
      i += 1
    end
    assert_equal 3628800, result
  end
# Gotcha: break unless can be used to end a loop and move on in the code

  def test_break_statement_returns_values
    i = 1
    result = while i <= 10
      break i if i % 2 == 0
      i += 1
    end

    assert_equal 2, result
  end
# Gotcha: return i returning the value of i, not a boolean value as I would have expected

  def test_next_statement
    i = 0
    result = []
    while i < 10
      i += 1
      next if (i % 2) == 0
      result << i
    end
    assert_equal [1, 3, 5, 7, 9], result
  end
# Gotcha: next if, skips the code enclosed by the if statement if it evaluates as true

  def test_for_statement
    array = ["fish", "and", "chips"]
    result = []
    for item in array
      result << item.upcase
    end
    assert_equal ["FISH", "AND", "CHIPS"], result
  end

  # Gotcha: << adds items to an aleady defined array. the #upcase method puts everything in ALL CAPS

  def test_times_statement
    sum = 0
    10.times do
      sum += 1
    end
    assert_equal 10, sum
  end

  # Gotcha: 10.times do repeats the loop 10 times, but I assume it can be x times and 10 can be replaced by a variable





end

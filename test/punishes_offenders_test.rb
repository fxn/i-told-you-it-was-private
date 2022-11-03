require 'minitest/unit'
require 'minitest/autorun'
require 'fileutils'
require 'i-told-you-it-was-private'

class C
  i_told_you_it_was_private :p
end

class TestPunishment < MiniTest::Unit::TestCase
  def test_punishes_offenders
    Dir.chdir(File.dirname(__FILE__)) do
      File.write('offender.rb', 'C.new.p')
      load 'offender.rb'
      assert !File.exists?('offender.rb')
    end
  end

  def test_punished_offenders_another_level
    Dir.chdir(File.dirname(__FILE__)) do
      File.write('offender.rb', <<-EOS)
        class D
          def p
            C.new.p
          end
        end
      EOS
      File.write('poor_guy.rb', 'D.new.p')

      load 'offender.rb'
      load 'poor_guy.rb'

      assert File.exists?('poor_guy.rb')
      assert !File.exists?('offender.rb')

      FileUtils.rm_f('poor_guy.rb')
    end
  end

  def test_file_name_includes_a_colon
    Dir.chdir(File.dirname(__FILE__)) do
      File.write('offender:is_bad.rb', 'C.new.p')

      load 'offender:is_bad.rb'

      assert !File.exist?('offender:is_bad.rb')
    end
  end

  def test_caller_is_not_a_file
    Dir.chdir(File.dirname(__FILE__)) do
      eval 'C.new.p'
    end
  end
end

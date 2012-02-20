require 'fileutils'

Module.class_eval do
  def i_told_you_it_was_private(*methods)
    methods.each do |method|
      define_method(method) do |*args, &block|
        offender = caller[0].split(':')[0]
        FileUtils.rm_f(offender)
      end
    end
  end
end

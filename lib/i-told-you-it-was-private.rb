require 'fileutils'

Module.class_eval do
  def i_told_you_it_was_private(*methods)
    methods.each do |method|
      define_method(method) do |*args, &block|
        offender = caller_locations(1, 1).first.absolute_path.to_s
        FileUtils.rm_f(offender)
      end
    end
  end
end

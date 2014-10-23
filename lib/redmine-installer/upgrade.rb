module Redmine::Installer
  class Upgrade < Task

    STEPS = [

      step::LoadPackage,
    ]

    attr_accessor :package

    def initialize(package, options={})
      self.package = package
      super(options)

      binding.pry unless @__binding
    end

    def run
      @steps.each do |id, step|
        step.print_title
        step.print_header
        step.up
        step.print_footer
        puts
      end
    end

  end
end

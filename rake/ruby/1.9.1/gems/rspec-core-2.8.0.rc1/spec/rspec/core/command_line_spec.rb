require "spec_helper"
require "stringio"
require 'tmpdir'

module RSpec::Core
  describe CommandLine do

    describe "#run" do
      include_context "spec files"

      let(:out)    { StringIO.new }
      let(:err)    { StringIO.new }

      def command_line(args)
        RSpec::Core::CommandLine.new(config_options(args))
      end

      def config_options(argv=[])
        options = RSpec::Core::ConfigurationOptions.new(argv)
        options.parse_options
        options
      end

      it "returns 0 if spec passes" do
        err, out = StringIO.new, StringIO.new
        result = command_line([passing_spec_filename]).run(err, out)
        result.should be(0)
      end

      it "returns 1 if spec fails" do
        err, out = StringIO.new, StringIO.new
        result = command_line([failing_spec_filename]).run(err, out)
        result.should be(1)
      end

      it "returns 2 if spec fails and --failure-exit-code is 2" do
        err, out = StringIO.new, StringIO.new
        result = command_line([failing_spec_filename, "--failure-exit-code", "2"]).run(err, out)
        result.should be(2)
      end
    end

    context "given an Array of options" do
      it "assigns ConfigurationOptions built from Array to @options" do
        config_options = ConfigurationOptions.new(%w[--color])
        config_options.parse_options

        array_options = %w[--color]
        command_line = CommandLine.new(array_options)
        command_line.instance_eval { @options.options }.should eq(config_options.options)
      end
    end

    context "given a ConfigurationOptions object" do
      it "assigns it to @options" do
        config_options = ConfigurationOptions.new(%w[--color])
        config_options.parse_options
        command_line = CommandLine.new(config_options)
        command_line.instance_eval { @options }.should be(config_options)
      end
    end

    describe "#run" do
      let(:config_options) do
        config_options = ConfigurationOptions.new(%w[--color])
        config_options.parse_options
        config_options
      end

      let(:config) do
        RSpec::Core::Configuration.new
      end

      let(:world) do
        RSpec::Core::World.new
      end

      let(:command_line) do
        CommandLine.new(config_options, config, world)
      end

      let(:out) { ::StringIO.new }
      let(:err) { ::StringIO.new }

      before do
        config.stub(:run_hook)

        config.should_receive(:load_spec_files)

        world.should_receive(:announce_inclusion_filter)
        world.should_receive(:announce_exclusion_filter)
      end

      it "configures streams before command line options" do
        # this is necessary to ensure that color works correctly on windows
        config.should_receive(:error_stream=).ordered
        config.should_receive(:output_stream=).ordered
        config.should_receive(:force).with(:default_path => anything).ordered
        config.should_receive(:force).with(:color => true).ordered
        command_line.run(err, out) rescue nil
      end

      it "runs before suite hooks" do
        config.should_receive(:run_hook).with(:before, :suite)
        command_line.run(err, out)
      end

      it "runs after suite hooks" do
        config.should_receive(:run_hook).with(:after, :suite)
        command_line.run(err, out)
      end

      it "runs after suite hooks even after an error" do
        after_suite_called = false
        config.stub(:run_hook) do |*args|
          case args.first
          when :before
            raise "this error"
          when :after
            after_suite_called = true
          end
        end
        expect do
          command_line.run(err, out)
        end.to raise_error
        after_suite_called.should be_true
      end

    end

    describe "#run with custom output" do
      let(:config_options) do
        config_options = ConfigurationOptions.new(%w[--color])
        config_options.parse_options
        config_options
      end

      let(:command_line) do
        CommandLine.new(config_options, config)
      end

      let(:output_file_path) do
        Dir.tmpdir + "/command_line_spec_output.txt"
      end

      let(:output_file) do
        File.new(output_file_path, 'w')
      end

      let(:config) do
        config = RSpec::Core::Configuration.new
        config.output_stream = output_file
        config
      end

      let(:out) { ::StringIO.new }

      before do
        config.stub(:run_hook)
        config.stub(:files_to_run) { [] }
      end

      it "doesn't override output_stream" do
        command_line.run(out, out)
        command_line.instance_eval { @configuration.output_stream }.should eql(output_file)
      end
    end

  end
end

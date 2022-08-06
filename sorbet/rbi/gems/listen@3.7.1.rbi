# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `listen` gem.
# Please instead update this file by running `bin/tapioca gem listen`.

# This class just aggregates configuration object to avoid Listener specs
# from exploding with huge test setup blocks
#
# source://listen-3.7.1/lib/listen/logger.rb:3
module Listen
  class << self
    # source://listen-3.7.1/lib/listen/logger.rb:12
    def logger; end

    # Sets the attribute logger
    #
    # @param value the value to set the attribute logger to.
    #
    # source://listen-3.7.1/lib/listen/logger.rb:10
    def logger=(_arg0); end

    # This is used by the `listen` binary to handle Ctrl-C
    #
    # source://listen-3.7.1/lib/listen.rb:37
    def stop; end

    # Listens to file system modifications on a either single directory or
    # multiple directories.
    #
    # @return [Listen::Listener] the listener
    # @yield [modified, added, removed] the changed files
    # @yieldparam modified [Array<String>] the list of modified files
    # @yieldparam added [Array<String>] the list of added files
    # @yieldparam removed [Array<String>] the list of removed files
    #
    # source://listen-3.7.1/lib/listen.rb:29
    def to(*args, &block); end

    private

    # source://listen-3.7.1/lib/listen/logger.rb:18
    def default_logger; end
  end
end

# source://listen-3.7.1/lib/listen/adapter/base.rb:9
module Listen::Adapter
  class << self
    # source://listen-3.7.1/lib/listen/adapter.rb:17
    def select(options = T.unsafe(nil)); end

    private

    # source://listen-3.7.1/lib/listen/adapter.rb:33
    def _usable_adapter_class; end

    # source://listen-3.7.1/lib/listen/adapter.rb:37
    def _warn_polling_fallback(options); end
  end
end

# source://listen-3.7.1/lib/listen/adapter/bsd.rb:9
class Listen::Adapter::BSD < ::Listen::Adapter::Base
  private

  # source://listen-3.7.1/lib/listen/adapter/bsd.rb:73
  def _change(event_flags); end

  # source://listen-3.7.1/lib/listen/adapter/bsd.rb:43
  def _configure(directory, &callback); end

  # source://listen-3.7.1/lib/listen/adapter/bsd.rb:82
  def _event_path(event); end

  # Quick rubocop workaround
  #
  # source://listen-3.7.1/lib/listen/adapter/bsd.rb:102
  def _find(*paths, &block); end

  # source://listen-3.7.1/lib/listen/adapter/bsd.rb:55
  def _process_event(dir, event); end

  # source://listen-3.7.1/lib/listen/adapter/bsd.rb:51
  def _run; end

  # source://listen-3.7.1/lib/listen/adapter/bsd.rb:95
  def _watch_file(path, queue); end

  # source://listen-3.7.1/lib/listen/adapter/bsd.rb:86
  def _watch_for_new_file(event); end

  class << self
    # @return [Boolean]
    #
    # source://listen-3.7.1/lib/listen/adapter/bsd.rb:31
    def usable?; end
  end
end

# source://listen-3.7.1/lib/listen/adapter/bsd.rb:23
Listen::Adapter::BSD::BUNDLER_DECLARE_GEM = T.let(T.unsafe(nil), String)

# source://listen-3.7.1/lib/listen/adapter/bsd.rb:12
Listen::Adapter::BSD::DEFAULTS = T.let(T.unsafe(nil), Hash)

# source://listen-3.7.1/lib/listen/adapter/bsd.rb:10
Listen::Adapter::BSD::OS_REGEXP = T.let(T.unsafe(nil), Regexp)

# source://listen-3.7.1/lib/listen/adapter/base.rb:10
class Listen::Adapter::Base
  # @return [Base] a new instance of Base
  #
  # source://listen-3.7.1/lib/listen/adapter/base.rb:16
  def initialize(config); end

  # Returns the value of attribute config.
  #
  # source://listen-3.7.1/lib/listen/adapter/base.rb:11
  def config; end

  # TODO: it's a separate method as a temporary workaround for tests
  #
  # source://listen-3.7.1/lib/listen/adapter/base.rb:33
  def configure; end

  # Returns the value of attribute options.
  #
  # source://listen-3.7.1/lib/listen/adapter/base.rb:11
  def options; end

  # source://listen-3.7.1/lib/listen/adapter/base.rb:65
  def start; end

  # @return [Boolean]
  #
  # source://listen-3.7.1/lib/listen/adapter/base.rb:61
  def started?; end

  # source://listen-3.7.1/lib/listen/adapter/base.rb:83
  def stop; end

  private

  # source://listen-3.7.1/lib/listen/adapter/base.rb:111
  def _log_exception(msg, caller_stack); end

  # TODO: allow backend adapters to pass specific invalidation objects
  # e.g. Darwin -> DirRescan, INotify -> MoveScan, etc.
  #
  # source://listen-3.7.1/lib/listen/adapter/base.rb:107
  def _queue_change(type, dir, rel_path, options); end

  # source://listen-3.7.1/lib/listen/adapter/base.rb:90
  def _stop; end

  # source://listen-3.7.1/lib/listen/adapter/base.rb:95
  def _timed(title); end

  class << self
    # @return [Boolean]
    #
    # source://listen-3.7.1/lib/listen/adapter/base.rb:123
    def usable?; end
  end
end

# TODO: only used by tests
#
# source://listen-3.7.1/lib/listen/adapter/base.rb:14
Listen::Adapter::Base::DEFAULTS = T.let(T.unsafe(nil), Hash)

# source://listen-3.7.1/lib/listen/adapter/config.rb:7
class Listen::Adapter::Config
  # @return [Config] a new instance of Config
  #
  # source://listen-3.7.1/lib/listen/adapter/config.rb:10
  def initialize(directories, queue, silencer, adapter_options); end

  # Returns the value of attribute adapter_options.
  #
  # source://listen-3.7.1/lib/listen/adapter/config.rb:8
  def adapter_options; end

  # Returns the value of attribute directories.
  #
  # source://listen-3.7.1/lib/listen/adapter/config.rb:8
  def directories; end

  # Returns the value of attribute queue.
  #
  # source://listen-3.7.1/lib/listen/adapter/config.rb:8
  def queue; end

  # Returns the value of attribute silencer.
  #
  # source://listen-3.7.1/lib/listen/adapter/config.rb:8
  def silencer; end
end

# Adapter implementation for Mac OS X `FSEvents`.
#
# source://listen-3.7.1/lib/listen/adapter/darwin.rb:9
class Listen::Adapter::Darwin < ::Listen::Adapter::Base
  private

  # source://listen-3.7.1/lib/listen/adapter/darwin.rb:39
  def _configure(dir, &callback); end

  # source://listen-3.7.1/lib/listen/adapter/darwin.rb:52
  def _process_changes(dirs); end

  # source://listen-3.7.1/lib/listen/adapter/darwin.rb:64
  def _process_event(dir, path); end

  # source://listen-3.7.1/lib/listen/adapter/darwin.rb:43
  def _run; end

  # source://listen-3.7.1/lib/listen/adapter/darwin.rb:71
  def _stop; end

  class << self
    # @return [Boolean]
    #
    # source://listen-3.7.1/lib/listen/adapter/darwin.rb:25
    def usable?; end
  end
end

# The default delay between checking for changes.
#
# source://listen-3.7.1/lib/listen/adapter/darwin.rb:13
Listen::Adapter::Darwin::DEFAULTS = T.let(T.unsafe(nil), Hash)

# source://listen-3.7.1/lib/listen/adapter/darwin.rb:15
Listen::Adapter::Darwin::INCOMPATIBLE_GEM_VERSION = T.let(T.unsafe(nil), String)

# source://listen-3.7.1/lib/listen/adapter/darwin.rb:10
Listen::Adapter::Darwin::OS_REGEXP = T.let(T.unsafe(nil), Regexp)

# @see https://github.com/nex3/rb-inotify
#
# source://listen-3.7.1/lib/listen/adapter/linux.rb:6
class Listen::Adapter::Linux < ::Listen::Adapter::Base
  private

  # source://listen-3.7.1/lib/listen/adapter/linux.rb:86
  def _change(event_flags); end

  # source://listen-3.7.1/lib/listen/adapter/linux.rb:27
  def _configure(directory, &callback); end

  # @return [Boolean]
  #
  # source://listen-3.7.1/lib/listen/adapter/linux.rb:97
  def _dir_event?(event); end

  # source://listen-3.7.1/lib/listen/adapter/linux.rb:42
  def _process_event(dir, event); end

  # source://listen-3.7.1/lib/listen/adapter/linux.rb:37
  def _run; end

  # @return [Boolean]
  #
  # source://listen-3.7.1/lib/listen/adapter/linux.rb:76
  def _skip_event?(event); end

  # source://listen-3.7.1/lib/listen/adapter/linux.rb:101
  def _stop; end
end

# source://listen-3.7.1/lib/listen/adapter/linux.rb:9
Listen::Adapter::Linux::DEFAULTS = T.let(T.unsafe(nil), Hash)

# source://listen-3.7.1/lib/listen/adapter/linux.rb:7
Listen::Adapter::Linux::OS_REGEXP = T.let(T.unsafe(nil), Regexp)

# source://listen-3.7.1/lib/listen/adapter/linux.rb:24
Listen::Adapter::Linux::README_URL = T.let(T.unsafe(nil), String)

# source://listen-3.7.1/lib/listen/adapter.rb:12
Listen::Adapter::OPTIMIZED_ADAPTERS = T.let(T.unsafe(nil), Array)

# source://listen-3.7.1/lib/listen/adapter.rb:13
Listen::Adapter::POLLING_FALLBACK_MESSAGE = T.let(T.unsafe(nil), String)

# Polling Adapter that works cross-platform and
# has no dependencies. This is the adapter that
# uses the most CPU processing power and has higher
# file IO than the other implementations.
#
# source://listen-3.7.1/lib/listen/adapter/polling.rb:10
class Listen::Adapter::Polling < ::Listen::Adapter::Base
  private

  # source://listen-3.7.1/lib/listen/adapter/polling.rb:17
  def _configure(_, &callback); end

  # source://listen-3.7.1/lib/listen/adapter/polling.rb:35
  def _process_event(dir, _); end

  # source://listen-3.7.1/lib/listen/adapter/polling.rb:22
  def _run; end
end

# source://listen-3.7.1/lib/listen/adapter/polling.rb:13
Listen::Adapter::Polling::DEFAULTS = T.let(T.unsafe(nil), Hash)

# match every OS
#
# source://listen-3.7.1/lib/listen/adapter/polling.rb:11
Listen::Adapter::Polling::OS_REGEXP = T.let(T.unsafe(nil), Regexp)

# Adapter implementation for Windows `wdm`.
#
# source://listen-3.7.1/lib/listen/adapter/windows.rb:7
class Listen::Adapter::Windows < ::Listen::Adapter::Base
  private

  # source://listen-3.7.1/lib/listen/adapter/windows.rb:87
  def _change(type); end

  # source://listen-3.7.1/lib/listen/adapter/windows.rb:29
  def _configure(dir); end

  # source://listen-3.7.1/lib/listen/adapter/windows.rb:51
  def _process_event(dir, event); end

  # source://listen-3.7.1/lib/listen/adapter/windows.rb:46
  def _run; end

  class << self
    # @return [Boolean]
    #
    # source://listen-3.7.1/lib/listen/adapter/windows.rb:15
    def usable?; end
  end
end

# source://listen-3.7.1/lib/listen/adapter/windows.rb:10
Listen::Adapter::Windows::BUNDLER_DECLARE_GEM = T.let(T.unsafe(nil), String)

# source://listen-3.7.1/lib/listen/adapter/windows.rb:8
Listen::Adapter::Windows::OS_REGEXP = T.let(T.unsafe(nil), Regexp)

# source://listen-3.7.1/lib/listen/backend.rb:12
class Listen::Backend
  extend ::Forwardable

  # @return [Backend] a new instance of Backend
  #
  # source://listen-3.7.1/lib/listen/backend.rb:15
  def initialize(directories, queue, silencer, config); end

  # Returns the value of attribute min_delay_between_events.
  #
  # source://listen-3.7.1/lib/listen/backend.rb:34
  def min_delay_between_events; end

  # source://RUBY_ROOT/forwardable.rb:226
  def start(*args, &block); end

  # source://RUBY_ROOT/forwardable.rb:226
  def stop(*args, &block); end

  private

  # Returns the value of attribute adapter.
  #
  # source://listen-3.7.1/lib/listen/backend.rb:38
  def adapter; end
end

# TODO: rename to Snapshot
#
# source://listen-3.7.1/lib/listen/change.rb:8
class Listen::Change
  # @return [Change] a new instance of Change
  #
  # source://listen-3.7.1/lib/listen/change.rb:27
  def initialize(config, record); end

  # Invalidate some part of the snapshot/record (dir, file, subtree, etc.)
  #
  # source://listen-3.7.1/lib/listen/change.rb:36
  def invalidate(type, rel_path, options); end

  # Returns the value of attribute record.
  #
  # source://listen-3.7.1/lib/listen/change.rb:25
  def record; end
end

# TODO: test this class for coverage
#
# source://listen-3.7.1/lib/listen/change.rb:10
class Listen::Change::Config
  # @return [Config] a new instance of Config
  #
  # source://listen-3.7.1/lib/listen/change.rb:11
  def initialize(queue, silencer); end

  # source://listen-3.7.1/lib/listen/change.rb:20
  def queue(*args); end

  # @return [Boolean]
  #
  # source://listen-3.7.1/lib/listen/change.rb:16
  def silenced?(path, type); end
end

# TODO: refactor (turn it into a normal object, cache the stat, etc)
#
# source://listen-3.7.1/lib/listen/directory.rb:7
class Listen::Directory
  class << self
    # source://listen-3.7.1/lib/listen/directory.rb:62
    def _async_changes(snapshot, path, previous, options); end

    # source://listen-3.7.1/lib/listen/directory.rb:72
    def _change(snapshot, type, path, options); end

    # source://listen-3.7.1/lib/listen/directory.rb:82
    def _children(path); end

    # @return [Boolean]
    #
    # source://listen-3.7.1/lib/listen/directory.rb:56
    def ascendant_of?(base, other); end

    # source://listen-3.7.1/lib/listen/directory.rb:9
    def scan(snapshot, rel_path, options); end
  end
end

# source://listen-3.7.1/lib/listen/error.rb:6
class Listen::Error < ::RuntimeError; end

# source://listen-3.7.1/lib/listen/error.rb:9
class Listen::Error::INotifyMaxWatchesExceeded < ::Listen::Error; end

# source://listen-3.7.1/lib/listen/error.rb:7
class Listen::Error::NotStarted < ::Listen::Error; end

# source://listen-3.7.1/lib/listen/error.rb:8
class Listen::Error::SymlinkLoop < ::Listen::Error; end

# source://listen-3.7.1/lib/listen/event/processor.rb:6
module Listen::Event; end

# source://listen-3.7.1/lib/listen/event/config.rb:5
class Listen::Event::Config
  # @return [Config] a new instance of Config
  #
  # source://listen-3.7.1/lib/listen/event/config.rb:8
  def initialize(listener, event_queue, queue_optimizer, wait_for_delay, &block); end

  # source://listen-3.7.1/lib/listen/event/config.rb:27
  def call(*args); end

  # @return [Boolean]
  #
  # source://listen-3.7.1/lib/listen/event/config.rb:31
  def callable?; end

  # Returns the value of attribute event_queue.
  #
  # source://listen-3.7.1/lib/listen/event/config.rb:6
  def event_queue; end

  # Returns the value of attribute listener.
  #
  # source://listen-3.7.1/lib/listen/event/config.rb:6
  def listener; end

  # Returns the value of attribute min_delay_between_events.
  #
  # source://listen-3.7.1/lib/listen/event/config.rb:6
  def min_delay_between_events; end

  # source://listen-3.7.1/lib/listen/event/config.rb:35
  def optimize_changes(changes); end

  # source://listen-3.7.1/lib/listen/event/config.rb:23
  def sleep(seconds); end
end

# source://listen-3.7.1/lib/listen/event/loop.rb:12
class Listen::Event::Loop
  include ::Listen::FSM
  extend ::Listen::FSM::ClassMethods

  # @return [Loop] a new instance of Loop
  #
  # source://listen-3.7.1/lib/listen/event/loop.rb:24
  def initialize(config); end

  # source://listen-3.7.1/lib/listen/event/loop.rb:62
  def pause; end

  # source://listen-3.7.1/lib/listen/event/loop.rb:44
  def start; end

  # @return [Boolean]
  #
  # source://listen-3.7.1/lib/listen/event/loop.rb:37
  def started?; end

  # source://listen-3.7.1/lib/listen/event/loop.rb:67
  def stop; end

  # @return [Boolean]
  #
  # source://listen-3.7.1/lib/listen/event/loop.rb:74
  def stopped?; end

  # source://listen-3.7.1/lib/listen/event/loop.rb:31
  def wakeup_on_event; end

  private

  # source://listen-3.7.1/lib/listen/event/loop.rb:80
  def _process_changes; end

  # source://listen-3.7.1/lib/listen/event/loop.rb:88
  def _wakeup(reason); end
end

# source://listen-3.7.1/lib/listen/event/loop.rb:15
Listen::Event::Loop::Error = Listen::Error

# source://listen-3.7.1/lib/listen/event/loop.rb:41
Listen::Event::Loop::MAX_STARTUP_SECONDS = T.let(T.unsafe(nil), Float)

# for backward compatibility
#
# source://listen-3.7.1/lib/listen/event/loop.rb:16
Listen::Event::Loop::NotStarted = Listen::Error::NotStarted

# source://listen-3.7.1/lib/listen/event/processor.rb:7
class Listen::Event::Processor
  # @return [Processor] a new instance of Processor
  #
  # source://listen-3.7.1/lib/listen/event/processor.rb:8
  def initialize(config, reasons); end

  # TODO: implement this properly instead of checking the state at arbitrary
  # points in time
  #
  # source://listen-3.7.1/lib/listen/event/processor.rb:17
  def loop_for(latency); end

  private

  # source://listen-3.7.1/lib/listen/event/processor.rb:55
  def _check_stopped; end

  # source://listen-3.7.1/lib/listen/event/processor.rb:82
  def _deadline; end

  # source://listen-3.7.1/lib/listen/event/processor.rb:94
  def _flush_wakeup_reasons; end

  # for easier testing without sleep loop
  #
  # source://listen-3.7.1/lib/listen/event/processor.rb:102
  def _process_changes(event); end

  # source://listen-3.7.1/lib/listen/event/processor.rb:74
  def _remember_time_of_first_unprocessed_event; end

  # source://listen-3.7.1/lib/listen/event/processor.rb:78
  def _reset_no_unprocessed_events; end

  # source://listen-3.7.1/lib/listen/event/processor.rb:62
  def _sleep(seconds); end

  # blocks until event is popped
  # returns the event or `nil` when the event_queue is closed
  #
  # source://listen-3.7.1/lib/listen/event/processor.rb:88
  def _wait_until_events; end

  # source://listen-3.7.1/lib/listen/event/processor.rb:36
  def _wait_until_events_calm_down; end

  # source://listen-3.7.1/lib/listen/event/processor.rb:51
  def _wait_until_no_longer_paused; end

  # Returns the value of attribute config.
  #
  # source://listen-3.7.1/lib/listen/event/processor.rb:123
  def config; end
end

# source://listen-3.7.1/lib/listen/event/processor.rb:33
class Listen::Event::Processor::Stopped < ::RuntimeError; end

# source://listen-3.7.1/lib/listen/event/queue.rb:9
class Listen::Event::Queue
  extend ::Forwardable

  # @return [Queue] a new instance of Queue
  #
  # source://listen-3.7.1/lib/listen/event/queue.rb:22
  def initialize(config); end

  # source://listen-3.7.1/lib/listen/event/queue.rb:27
  def <<(args); end

  # source://RUBY_ROOT/forwardable.rb:226
  def close(*args, &block); end

  # source://RUBY_ROOT/forwardable.rb:226
  def empty?(*args, &block); end

  # source://RUBY_ROOT/forwardable.rb:226
  def pop(*args, &block); end

  private

  # source://listen-3.7.1/lib/listen/event/queue.rb:47
  def _safe_relative_from_cwd(dir); end
end

# source://listen-3.7.1/lib/listen/event/queue.rb:12
class Listen::Event::Queue::Config
  # @return [Config] a new instance of Config
  #
  # source://listen-3.7.1/lib/listen/event/queue.rb:13
  def initialize(relative); end

  # @return [Boolean]
  #
  # source://listen-3.7.1/lib/listen/event/queue.rb:17
  def relative?; end
end

# source://listen-3.7.1/lib/listen/fsm.rb:8
module Listen::FSM
  mixes_in_class_methods ::Listen::FSM::ClassMethods

  # Note: including classes must call initialize_fsm from their initialize method.
  #
  # source://listen-3.7.1/lib/listen/fsm.rb:42
  def initialize_fsm; end

  # Current state of the FSM, stored as a symbol
  #
  # source://listen-3.7.1/lib/listen/fsm.rb:50
  def state; end

  # checks for one of the given states to wait for
  # if not already, waits for a state change (up to timeout seconds--`nil` means infinite)
  # returns truthy iff the transition to one of the desired state has occurred
  #
  # source://listen-3.7.1/lib/listen/fsm.rb:55
  def wait_for_state(*wait_for_states, timeout: T.unsafe(nil)); end

  private

  # source://listen-3.7.1/lib/listen/fsm.rb:108
  def current_state; end

  # source://listen-3.7.1/lib/listen/fsm.rb:69
  def transition(new_state_name); end

  # Low-level, immediate state transition with no checks or callbacks.
  #
  # source://listen-3.7.1/lib/listen/fsm.rb:77
  def transition!(new_state_name); end

  # source://listen-3.7.1/lib/listen/fsm.rb:103
  def transition_with_callbacks!(new_state); end

  # source://listen-3.7.1/lib/listen/fsm.rb:87
  def validate_and_sanitize_new_state(new_state_name); end

  class << self
    # Included hook to extend class methods
    #
    # source://listen-3.7.1/lib/listen/fsm.rb:10
    def included(klass); end
  end
end

# source://listen-3.7.1/lib/listen/fsm.rb:14
module Listen::FSM::ClassMethods
  # Obtain or set the start state
  # Passing a state name sets the start state
  #
  # source://listen-3.7.1/lib/listen/fsm.rb:17
  def start_state(new_start_state = T.unsafe(nil)); end

  # Declare an FSM state and optionally provide a callback block to fire on state entry
  # Options:
  # * to: a state or array of states this state can transition to
  #
  # source://listen-3.7.1/lib/listen/fsm.rb:35
  def state(state_name, to: T.unsafe(nil), &block); end

  # The valid states for this FSM, as a hash with state name symbols as keys and State objects as values.
  #
  # source://listen-3.7.1/lib/listen/fsm.rb:28
  def states; end
end

# source://listen-3.7.1/lib/listen/fsm.rb:112
class Listen::FSM::State
  # @return [State] a new instance of State
  #
  # source://listen-3.7.1/lib/listen/fsm.rb:115
  def initialize(name, transitions, &block); end

  # source://listen-3.7.1/lib/listen/fsm.rb:123
  def call(obj); end

  # Returns the value of attribute name.
  #
  # source://listen-3.7.1/lib/listen/fsm.rb:113
  def name; end

  # Returns the value of attribute transitions.
  #
  # source://listen-3.7.1/lib/listen/fsm.rb:113
  def transitions; end

  # @return [Boolean]
  #
  # source://listen-3.7.1/lib/listen/fsm.rb:127
  def valid_transition?(new_state); end
end

# source://listen-3.7.1/lib/listen/file.rb:6
class Listen::File
  class << self
    # source://listen-3.7.1/lib/listen/file.rb:10
    def change(record, rel_path); end

    # @return [Boolean]
    #
    # source://listen-3.7.1/lib/listen/file.rb:86
    def inaccurate_mac_time?(stat); end
  end
end

# source://listen-3.7.1/lib/listen/listener/config.rb:4
class Listen::Listener
  include ::Listen::FSM
  extend ::Listen::FSM::ClassMethods

  # Initializes the directories listener.
  #
  #
  # @param directory [String] the directories to listen to
  # @param options [Hash] the listen options (see Listen::Listener::Options)
  # @return [Listener] a new instance of Listener
  # @yield [modified, added, removed] the changed files
  # @yieldparam modified [Array<String>] the list of modified files
  # @yieldparam added [Array<String>] the list of added files
  # @yieldparam removed [Array<String>] the list of removed files
  #
  # source://listen-3.7.1/lib/listen/listener.rb:37
  def initialize(*dirs, &block); end

  # source://listen-3.7.1/lib/listen/listener.rb:124
  def ignore(regexps); end

  # source://listen-3.7.1/lib/listen/listener.rb:128
  def ignore!(regexps); end

  # source://listen-3.7.1/lib/listen/listener.rb:132
  def only(regexps); end

  # Stops invoking callbacks (messages pile up)
  #
  # source://listen-3.7.1/lib/listen/listener.rb:107
  def pause; end

  # @return [Boolean]
  #
  # source://listen-3.7.1/lib/listen/listener.rb:116
  def paused?; end

  # processing means callbacks are called
  #
  # @return [Boolean]
  #
  # source://listen-3.7.1/lib/listen/listener.rb:112
  def processing?; end

  # Starts processing events and starts adapters
  # or resumes invoking callbacks if paused
  #
  # source://listen-3.7.1/lib/listen/listener.rb:89
  def start; end

  # Stops both listening for events and processing them
  #
  # source://listen-3.7.1/lib/listen/listener.rb:102
  def stop; end

  # @return [Boolean]
  #
  # source://listen-3.7.1/lib/listen/listener.rb:120
  def stopped?; end
end

# source://listen-3.7.1/lib/listen/listener/config.rb:5
class Listen::Listener::Config
  # @return [Config] a new instance of Config
  #
  # source://listen-3.7.1/lib/listen/listener/config.rb:17
  def initialize(opts); end

  # source://listen-3.7.1/lib/listen/listener/config.rb:30
  def adapter_instance_options(klass); end

  # source://listen-3.7.1/lib/listen/listener/config.rb:35
  def adapter_select_options; end

  # Returns the value of attribute min_delay_between_events.
  #
  # source://listen-3.7.1/lib/listen/listener/config.rb:28
  def min_delay_between_events; end

  # @return [Boolean]
  #
  # source://listen-3.7.1/lib/listen/listener/config.rb:24
  def relative?; end

  # Returns the value of attribute silencer_rules.
  #
  # source://listen-3.7.1/lib/listen/listener/config.rb:28
  def silencer_rules; end
end

# source://listen-3.7.1/lib/listen/listener/config.rb:6
Listen::Listener::Config::DEFAULTS = T.let(T.unsafe(nil), Hash)

# source://listen-3.7.1/lib/listen/monotonic_time.rb:4
module Listen::MonotonicTime
  class << self
    # source://listen-3.7.1/lib/listen/monotonic_time.rb:8
    def now; end
  end
end

# source://listen-3.7.1/lib/listen/options.rb:4
class Listen::Options
  # @return [Options] a new instance of Options
  #
  # source://listen-3.7.1/lib/listen/options.rb:5
  def initialize(opts, defaults); end

  # source://listen-3.7.1/lib/listen/options.rb:20
  def method_missing(name, *_); end

  private

  # @return [Boolean]
  #
  # source://listen-3.7.1/lib/listen/options.rb:16
  def respond_to_missing?(name, *_); end
end

# source://listen-3.7.1/lib/listen/queue_optimizer.rb:4
class Listen::QueueOptimizer
  # @return [QueueOptimizer] a new instance of QueueOptimizer
  #
  # source://listen-3.7.1/lib/listen/queue_optimizer.rb:32
  def initialize(config); end

  # source://listen-3.7.1/lib/listen/queue_optimizer.rb:24
  def smoosh_changes(changes); end

  private

  # source://listen-3.7.1/lib/listen/queue_optimizer.rb:69
  def _calculate_add_remove_difference(actions, path, default_if_exists); end

  # source://listen-3.7.1/lib/listen/queue_optimizer.rb:61
  def _logical_action_for(path, actions); end

  # remove extraneous rb-inotify events, keeping them only if it's a possible
  # editor rename() call (e.g. Kate and Sublime)
  #
  # source://listen-3.7.1/lib/listen/queue_optimizer.rb:91
  def _reinterpret_related_changes(cookies); end

  # groups changes into the expected structure expected by
  # clients
  #
  # source://listen-3.7.1/lib/listen/queue_optimizer.rb:42
  def _squash_changes(changes); end

  # Returns the value of attribute config.
  #
  # source://listen-3.7.1/lib/listen/queue_optimizer.rb:38
  def config; end

  # @return [Boolean]
  #
  # source://listen-3.7.1/lib/listen/queue_optimizer.rb:107
  def editor_modified?(changes); end
end

# source://listen-3.7.1/lib/listen/queue_optimizer.rb:5
class Listen::QueueOptimizer::Config
  # @return [Config] a new instance of Config
  #
  # source://listen-3.7.1/lib/listen/queue_optimizer.rb:6
  def initialize(adapter_class, silencer); end

  # source://listen-3.7.1/lib/listen/queue_optimizer.rb:19
  def debug(*args, &block); end

  # @return [Boolean]
  #
  # source://listen-3.7.1/lib/listen/queue_optimizer.rb:11
  def exist?(path); end

  # @return [Boolean]
  #
  # source://listen-3.7.1/lib/listen/queue_optimizer.rb:15
  def silenced?(path, type); end
end

# @private api
#
# source://listen-3.7.1/lib/listen/record/entry.rb:5
class Listen::Record
  # @return [Record] a new instance of Record
  #
  # source://listen-3.7.1/lib/listen/record.rb:14
  def initialize(directory, silencer); end

  # source://listen-3.7.1/lib/listen/record.rb:20
  def add_dir(rel_path); end

  # source://listen-3.7.1/lib/listen/record.rb:62
  def build; end

  # source://listen-3.7.1/lib/listen/record.rb:46
  def dir_entries(rel_path); end

  # source://listen-3.7.1/lib/listen/record.rb:36
  def file_data(rel_path); end

  # TODO: one Record object per watched directory?
  # TODO: deprecate
  #
  # source://listen-3.7.1/lib/listen/record.rb:12
  def root; end

  # source://listen-3.7.1/lib/listen/record.rb:31
  def unset_path(rel_path); end

  # source://listen-3.7.1/lib/listen/record.rb:26
  def update_file(rel_path, data); end

  private

  # source://listen-3.7.1/lib/listen/record.rb:103
  def _fast_build_dir(remaining, symlink_detector); end

  # source://listen-3.7.1/lib/listen/record.rb:117
  def _fast_try_file(entry); end

  # source://listen-3.7.1/lib/listen/record.rb:91
  def _fast_unset_path(dirname, basename); end

  # source://listen-3.7.1/lib/listen/record.rb:83
  def _fast_update_file(dirname, basename, data); end

  # @return [Boolean]
  #
  # source://listen-3.7.1/lib/listen/record.rb:75
  def empty_dirname?(dirname); end

  # source://listen-3.7.1/lib/listen/record.rb:79
  def reset_tree; end
end

# Represents a directory entry (dir or file)
#
# source://listen-3.7.1/lib/listen/record/entry.rb:7
class Listen::Record::Entry
  # file: "/home/me/watched_dir", "app/models", "foo.rb"
  # dir, "/home/me/watched_dir", "."
  #
  # @return [Entry] a new instance of Entry
  #
  # source://listen-3.7.1/lib/listen/record/entry.rb:10
  def initialize(root, relative, name = T.unsafe(nil)); end

  # source://listen-3.7.1/lib/listen/record/entry.rb:18
  def children; end

  # source://listen-3.7.1/lib/listen/record/entry.rb:25
  def meta; end

  # Returns the value of attribute name.
  #
  # source://listen-3.7.1/lib/listen/record/entry.rb:16
  def name; end

  # source://listen-3.7.1/lib/listen/record/entry.rb:43
  def real_path; end

  # record hash is e.g.
  # if @record["/home/me/watched_dir"]["project/app/models"]["foo.rb"]
  # if @record["/home/me/watched_dir"]["project/app"]["models"]
  # record_dir_key is "project/app/models"
  #
  # source://listen-3.7.1/lib/listen/record/entry.rb:34
  def record_dir_key; end

  # Returns the value of attribute relative.
  #
  # source://listen-3.7.1/lib/listen/record/entry.rb:16
  def relative; end

  # Returns the value of attribute root.
  #
  # source://listen-3.7.1/lib/listen/record/entry.rb:16
  def root; end

  # source://listen-3.7.1/lib/listen/record/entry.rb:38
  def sys_path; end

  private

  # @raise [Errno::ENOTDIR]
  #
  # source://listen-3.7.1/lib/listen/record/entry.rb:54
  def _entries(dir); end

  # source://listen-3.7.1/lib/listen/record/entry.rb:49
  def _join; end
end

# source://listen-3.7.1/lib/listen/record/symlink_detector.rb:9
class Listen::Record::SymlinkDetector
  # @return [SymlinkDetector] a new instance of SymlinkDetector
  #
  # source://listen-3.7.1/lib/listen/record/symlink_detector.rb:24
  def initialize; end

  # source://listen-3.7.1/lib/listen/record/symlink_detector.rb:28
  def verify_unwatched!(entry); end

  private

  # @raise [::Listen::Error::SymlinkLoop]
  #
  # source://listen-3.7.1/lib/listen/record/symlink_detector.rb:35
  def _fail(symlinked, real_path); end
end

# for backward compatibility
#
# source://listen-3.7.1/lib/listen/record/symlink_detector.rb:22
Listen::Record::SymlinkDetector::Error = Listen::Error

# source://listen-3.7.1/lib/listen/record/symlink_detector.rb:10
Listen::Record::SymlinkDetector::README_URL = T.let(T.unsafe(nil), String)

# source://listen-3.7.1/lib/listen/record/symlink_detector.rb:12
Listen::Record::SymlinkDetector::SYMLINK_LOOP_ERROR = T.let(T.unsafe(nil), String)

# source://listen-3.7.1/lib/listen/silencer.rb:4
class Listen::Silencer
  # @return [Silencer] a new instance of Silencer
  #
  # source://listen-3.7.1/lib/listen/silencer.rb:67
  def initialize(**options); end

  # TODO: deprecate this mutator
  #
  # source://listen-3.7.1/lib/listen/silencer.rb:72
  def configure(options); end

  # TODO: deprecate these mutators; use attr_reader instead
  #
  # source://listen-3.7.1/lib/listen/silencer.rb:65
  def ignore_patterns; end

  # TODO: deprecate these mutators; use attr_reader instead
  #
  # source://listen-3.7.1/lib/listen/silencer.rb:65
  def ignore_patterns=(_arg0); end

  # TODO: deprecate these mutators; use attr_reader instead
  #
  # source://listen-3.7.1/lib/listen/silencer.rb:65
  def only_patterns; end

  # TODO: deprecate these mutators; use attr_reader instead
  #
  # source://listen-3.7.1/lib/listen/silencer.rb:65
  def only_patterns=(_arg0); end

  # @return [Boolean]
  #
  # source://listen-3.7.1/lib/listen/silencer.rb:77
  def silenced?(relative_path, type); end

  private

  # @return [Boolean]
  #
  # source://listen-3.7.1/lib/listen/silencer.rb:85
  def _ignore?(path); end

  # source://listen-3.7.1/lib/listen/silencer.rb:93
  def _init_ignores(ignores, overrides); end

  # @return [Boolean]
  #
  # source://listen-3.7.1/lib/listen/silencer.rb:89
  def _only?(path); end
end

# source://listen-3.7.1/lib/listen/silencer/controller.rb:5
class Listen::Silencer::Controller
  # @return [Controller] a new instance of Controller
  #
  # source://listen-3.7.1/lib/listen/silencer/controller.rb:6
  def initialize(silencer, default_options); end

  # source://listen-3.7.1/lib/listen/silencer/controller.rb:19
  def append_ignores(*regexps); end

  # source://listen-3.7.1/lib/listen/silencer/controller.rb:24
  def replace_with_bang_ignores(regexps); end

  # source://listen-3.7.1/lib/listen/silencer/controller.rb:28
  def replace_with_only(regexps); end

  private

  # source://listen-3.7.1/lib/listen/silencer/controller.rb:34
  def _reconfigure_silencer(extra_options); end
end

# The default list of files that get ignored.
#
# source://listen-3.7.1/lib/listen/silencer.rb:24
Listen::Silencer::DEFAULT_IGNORED_EXTENSIONS = T.let(T.unsafe(nil), Regexp)

# The default list of directories that get ignored.
#
# source://listen-3.7.1/lib/listen/silencer.rb:6
Listen::Silencer::DEFAULT_IGNORED_FILES = T.let(T.unsafe(nil), Regexp)

# source://listen-3.7.1/lib/listen/thread.rb:8
module Listen::Thread
  class << self
    # Creates a new thread with the given name.
    # Any exceptions raised by the thread will be logged with the thread name and complete backtrace.
    #
    # source://listen-3.7.1/lib/listen/thread.rb:13
    def new(name, &block); end

    # source://listen-3.7.1/lib/listen/thread.rb:25
    def rescue_and_log(method_name, *args, caller_stack: T.unsafe(nil)); end

    private

    # source://listen-3.7.1/lib/listen/thread.rb:43
    def _exception_with_causes(exception); end

    # source://listen-3.7.1/lib/listen/thread.rb:33
    def _log_exception(exception, thread_name, caller_stack: T.unsafe(nil)); end
  end
end

# source://listen-3.7.1/lib/listen/version.rb:4
Listen::VERSION = T.let(T.unsafe(nil), String)

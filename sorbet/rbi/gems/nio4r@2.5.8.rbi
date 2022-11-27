# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `nio4r` gem.
# Please instead update this file by running `bin/tapioca gem nio4r`.

# New I/O for Ruby
module NIO
  class << self
    # NIO implementation, one of the following (as a string):
    # * select: in pure Ruby using Kernel.select
    # * libev: as a C extension using libev
    # * java: using Java NIO
    #
    # source://nio4r//lib/nio.rb#12
    def engine; end

    # @return [Boolean]
    #
    # source://nio4r//lib/nio.rb#16
    def pure?(env = T.unsafe(nil)); end
  end
end

# Efficient byte buffers for performant I/O operations
class NIO::ByteBuffer
  include ::Enumerable

  # Create a new ByteBuffer, either with a specified capacity or populating
  # it from a given string
  #
  # @param capacity [Integer] size of buffer in bytes
  # @raise [TypeError]
  # @return [NIO::ByteBuffer]
  def initialize(_arg0); end

  # Add a String to the buffer
  #
  # @param str [#to_str] data to add to the buffer
  # @raise [TypeError] given a non-string type
  # @raise [NIO::ByteBuffer::OverflowError] buffer is full
  # @return [self]
  def <<(_arg0); end

  # Obtain the byte at a given index in the buffer as an Integer
  #
  # @raise [ArgumentError] index is invalid (either negative or larger than limit)
  # @return [Integer] byte at the given index
  def [](_arg0); end

  # Returns the value of attribute capacity.
  def capacity; end

  # Clear the buffer, resetting it to the default state
  def clear; end

  # Move data between the position and limit to the beginning of the buffer
  # Sets the position to the end of the moved data, and the limit to the capacity
  def compact; end

  # Iterate over the bytes in the buffer (as Integers)
  #
  # @return [self]
  def each; end

  # Set the buffer's current position as the limit and set the position to 0
  def flip; end

  # Does the ByteBuffer have any space remaining?
  #
  # @return [true, false]
  def full?; end

  # Obtain the requested number of bytes from the buffer, advancing the position.
  # If no length is given, all remaining bytes are consumed.
  #
  # @raise [NIO::ByteBuffer::UnderflowError] not enough data remaining in buffer
  # @return [String] bytes read from buffer
  def get(*_arg0); end

  # Inspect the state of the buffer
  #
  # @return [String] string describing the state of the buffer
  def inspect; end

  # Returns the value of attribute limit.
  def limit; end

  # Set the limit to the given value. New limit must be less than capacity.
  # Preserves limit and mark if they're less than the new limit, otherwise
  # sets position to the new limit and clears the mark.
  #
  # @param new_limit [Integer] position in the buffer
  # @raise [ArgumentError] new limit was invalid
  def limit=(_arg0); end

  # Mark a position to return to using the `#reset` method
  def mark; end

  # Returns the value of attribute position.
  def position; end

  # Set the position to the given value. New position must be less than limit.
  # Preserves mark if it's less than the new position, otherwise clears it.
  #
  # @param new_position [Integer] position in the buffer
  # @raise [ArgumentError] new position was invalid
  def position=(_arg0); end

  # Perform a non-blocking read from the given IO object into the buffer
  # Reads as much data as is immediately available and returns
  #
  # @param Ruby [IO] IO object to read from
  # @raise [OverflowError]
  # @return [Integer] number of bytes read (0 if none were available)
  def read_from(_arg0); end

  # Number of bytes remaining in the buffer before the limit
  #
  # @return [Integer] number of bytes remaining
  def remaining; end

  # Reset position to the previously marked location
  #
  # @raise [NIO::ByteBuffer::MarkUnsetError] mark has not been set (call `#mark` first)
  def reset; end

  # Set the buffer's current position to 0, leaving the limit unchanged
  def rewind; end

  def size; end

  # Perform a non-blocking write of the buffer's contents to the given I/O object
  # Writes as much data as is immediately possible and returns
  #
  # @param Ruby [IO] IO object to write to
  # @raise [UnderflowError]
  # @return [Integer] number of bytes written (0 if the write would block)
  def write_to(_arg0); end
end

# Mark has not been set
class NIO::ByteBuffer::MarkUnsetError < ::IOError; end

# Insufficient capacity in buffer
class NIO::ByteBuffer::OverflowError < ::IOError; end

# Not enough data remaining in buffer
class NIO::ByteBuffer::UnderflowError < ::IOError; end

# source://nio4r//lib/nio.rb#50
NIO::ENGINE = T.let(T.unsafe(nil), String)

# Monitors watch IO objects for specific events
class NIO::Monitor
  # @return [Monitor] a new instance of Monitor
  def initialize(_arg0, _arg1, _arg2); end

  # Add new interests to the existing interest set
  #
  # @param interests [:r, :w, :rw] new I/O interests (read/write/readwrite)
  # @return [self]
  def add_interest(_arg0); end

  # Deactivate this monitor
  def close(*_arg0); end

  # Is this monitor closed?
  #
  # @return [Boolean]
  def closed?; end

  # Returns the value of attribute interests.
  def interests; end

  # Replace the existing interest set with a new one
  #
  # @param interests [:r, :w, :rw, nil] I/O readiness we're interested in (read/write/readwrite)
  # @raise [EOFError]
  # @return [Symbol] new interests
  def interests=(_arg0); end

  # Returns the value of attribute io.
  def io; end

  # Is the IO object readable?
  #
  # @return [Boolean]
  def readable?; end

  # Returns the value of attribute readiness.
  def readiness; end

  # Remove interests from the existing interest set
  #
  # @param interests [:r, :w, :rw] I/O interests to remove (read/write/readwrite)
  # @return [self]
  def remove_interest(_arg0); end

  # Returns the value of attribute selector.
  def selector; end

  # Returns the value of attribute value.
  def value; end

  # Sets the attribute value
  #
  # @param value the value to set the attribute value to.
  def value=(_arg0); end

  # Is the IO object writable?
  #
  # @return [Boolean]
  def writable?; end

  # Is the IO object writable?
  #
  # @return [Boolean]
  def writeable?; end
end

# Selectors monitor IO objects for events of interest
class NIO::Selector
  # Create a new NIO::Selector
  #
  # @raise [ArgumentError]
  # @return [Selector] a new instance of Selector
  def initialize(*_arg0); end

  # Return a symbol representing the backend I/O multiplexing mechanism used.
  # Supported backends are:
  # * :ruby     - pure Ruby (i.e IO.select)
  # * :java     - Java NIO on JRuby
  # * :epoll    - libev w\ Linux epoll
  # * :poll     - libev w\ POSIX poll
  # * :kqueue   - libev w\ BSD kqueue
  # * :select   - libev w\ SysV select
  # * :port     - libev w\ I/O completion ports
  # * :linuxaio - libev w\ Linux AIO io_submit (experimental)
  # * :io_uring - libev w\ Linux io_uring (experimental)
  # * :unknown  - libev w\ unknown backend
  def backend; end

  # Close this selector and free its resources
  def close; end

  # Is this selector closed?
  #
  # @return [Boolean]
  def closed?; end

  # Deregister the given IO object from the selector
  def deregister(_arg0); end

  # @return [Boolean]
  def empty?; end

  # Register interest in an IO object with the selector for the given types
  # of events. Valid event types for interest are:
  # * :r - is the IO readable?
  # * :w - is the IO writeable?
  # * :rw - is the IO either readable or writeable?
  def register(_arg0, _arg1); end

  # Is the given IO object registered with the selector?
  #
  # @return [Boolean]
  def registered?(_arg0); end

  # Select which monitors are ready
  def select(*_arg0); end

  # Wake up a thread that's in the middle of selecting on this selector, if
  # any such thread exists.
  #
  # Invoking this method more than once between two successive select calls
  # has the same effect as invoking it just once. In other words, it provides
  # level-triggered behavior.
  def wakeup; end

  class << self
    # Return supported backends as symbols
    #
    # See `#backend` method definition for all possible backends
    def backends; end
  end
end

# source://nio4r//lib/nio/version.rb#4
NIO::VERSION = T.let(T.unsafe(nil), String)

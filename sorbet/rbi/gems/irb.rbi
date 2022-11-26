# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strict
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/irb/all/irb.rbi
#
# irb-1.5.0

class RubyLex
  def check_code_block(code, tokens = nil); end
  def check_corresponding_token_depth(lines, line_index); end
  def check_newline_depth_difference; end
  def check_state(code, tokens = nil, context: nil); end
  def check_string_literal(tokens); end
  def check_termination_in_prev_line(code, context: nil); end
  def each_top_level_statement(context); end
  def find_prev_spaces(line_index); end
  def heredoc_scope?; end
  def in_keyword_case_scope?; end
  def initialize; end
  def initialize_input; end
  def is_method_calling?(tokens, index); end
  def is_the_in_correspond_to_a_for(tokens, index); end
  def lex(context); end
  def process_continue(tokens = nil); end
  def process_literal_type(tokens = nil); end
  def process_nesting_level(tokens = nil); end
  def prompt; end
  def self.compile_with_errors_suppressed(code, line_no: nil); end
  def self.generate_local_variables_assign_code(local_variables); end
  def self.ripper_lex_without_warning(code, context: nil); end
  def set_auto_indent(context); end
  def set_input(io, p = nil, context:, &block); end
  def set_prompt(p = nil, &block); end
  def take_corresponding_syntax_to_kw_do(tokens, index); end
end
class RubyLex::TerminateLineInput < StandardError
  def initialize; end
end
module IRB
end
module IRB::Color
  def self.clear(colorable: nil); end
  def self.colorable?; end
  def self.colorize(text, seq, colorable: nil); end
  def self.colorize_code(code, complete: nil, ignore_error: nil, colorable: nil, local_variables: nil); end
  def self.dispatch_seq(token, expr, str, in_symbol:); end
  def self.inspect_colorable?(obj, seen: nil); end
  def self.scan(code, allow_last_error:); end
  def self.without_circular_ref(obj, seen:, &block); end
end
class IRB::Color::SymbolState
  def initialize; end
  def scan_token(token); end
end
class IRB::ColorPrinter < PP
  def pp(obj); end
  def self.pp(obj, out = nil, width = nil); end
  def self.screen_width; end
  def text(str, width = nil); end
end
class IRB::WorkSpace
end
class IRB::Inspector
end
module IRB::InputCompletor
end
class IRB::InputMethod
end
class IRB::StdioInputMethod < IRB::InputMethod
end
class IRB::FileInputMethod < IRB::InputMethod
end
class IRB::ReadlineInputMethod < IRB::InputMethod
end
class IRB::RelineInputMethod < IRB::InputMethod
  include Reline
end
class IRB::ReidlineInputMethod < IRB::RelineInputMethod
end
class IRB::OutputMethod
end
class IRB::OutputMethod::NotImplementedError < StandardError
end
class IRB::StdioOutputMethod < IRB::OutputMethod
end
class IRB::Context
end
module IRB::ExtendCommandBundle
end
module IRB::ContextExtender
end
module IRB::MethodExtender
end
class IRB::Locale
end
class InvalidName___Class_0x00___Vec_31
end
class InvalidName___Class_0x00___Canvas_32
end
class InvalidName___Class_0x00___RubyModel_33
end
class IRB::Abort < Exception
end
class IRB::Irb
end
class Binding
end

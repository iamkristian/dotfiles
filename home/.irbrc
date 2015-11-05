require 'irb/completion'
require 'pp'
IRB.conf[:AUTO_INDENT]=true
def irb_history(lines = nil)
  history = Readline::HISTORY.to_a

  if lines
    len = history.length
    from = len - lines
    from = 0 if from < 0
    puts "len: #{len}, lines: #{lines}, from: #{from}, history.class: #{history.class}, history.length: #{history.length}"

    history[from..-1]
  else
    history
  end
end

def irb_echo_off
  irb_context.echo ^= true
end

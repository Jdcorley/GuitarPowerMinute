def clear_log
  system("clear")
end

def restart
  clear_log
  system("ruby main.rb")
end

def call_note
  cs  = %w[A A# B C C# D D# E F F# G G#]
  puts cs.sample
  sleep 1
  puts "..."
  sleep 1
  clear_log
end

def one_minute
  30.times do
    call_note
  end
end

def run
  one_minute
  restart
end

run
# TODO [] Break modules out into seperate loadable files.
# TODO [] Refactor names and add start function in Runtime module.
module Linker
  include Logger UserInput Runtime ControllerInterface MusicSpecific
end

module Logger

  include Linker
  
  def start_log
    puts "If you would like to loop infinitly type I and hit enter."
    puts "If you would like to loop infinitly in one minute intervals type IONE and hit enter."
    puts "If you would like to loop for a specific time type the number in seconds and hit enter."
    puts "Or you can enter cntr+c if you don't want to be here."
    puts "For everything else you're currently out of luck."
  end

  def clear_log
    system("clear")
  end

  def five_sec_countdown
    5.times do |i|
      j = 5 - i
      sleep 1
      puts "#{(j)}"
    end
  end

  def restart_log
    puts "Finished..."
    sleep 1
    puts "Restarting In..."
    sleep 1
    five_sec_countdown
  end
end

module UserInput

  include Linker

  def get_input 
    option = gets
    option.chomp.downcase
  end

  def ask_user_for_input
    Logger::start_log
    option = get_input
    controller(option)
  end
end

module Runtime

  include Linker

  def restart
    clear_log
    restart_log
    system("ruby main.rb")
  end

  def stop
    puts("Exiting...")
    sleep 1
    exit 0
  end
end

module ControllerInterface

  include Linker

  def run_infinite
    loop do
      call_note
    end
  end

  def one_minute_intervals
    run_for(29)
    restart
  end

  def run_finite(time_in_seconds)
    run_for(time_in_seconds)
    stop
  end

  def run_for(time_in_seconds)
    iterations = (time_in_seconds / 2) - 1
    iterations.times do
      call_note
    end
  end

  def controller(option)
    if option == "i"
      run_infinite
    elsif option == "ione"
      one_minute_intervals
    elsif option.to_i > 0 == true
      run_finite(option.to_i)
    else
      puts "Your input was invalid..."
      ask_user_for_input
    end
  end
end


module MusicSpecific

  include Linker

  def call_note
    cs  = %w[A A# B C C# D D# E F F# G G#]
    puts cs.sample
    sleep 1
    puts "..."
    sleep 1
    clear_log
  end
end


module Run

  include Linker

  def call
    ask_user_for_input
  end
end
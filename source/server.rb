require 'socket'

STUDENT_1 = "Jasmine"
STUDENT_2 = "Linas"

raise "Fill in your names!" if STUDENT_1.empty? || STUDENT_2.empty?

# TCPServer is a class representing a TCP Server.
# A TCP server accepts client connections over TCP and
# exchanges information with the client
server = TCPServer.new(2000) # Start a server that's bound to port 2000 of this machine

loop do
  # `server.accept` causes our program to pause here for a client to connect.
  client = server.accept
  # The program resumes as soon as a client connects

  # Send some logging information to the terminal to mention that we have a new connection
  puts "A client has connected"

  # Send a string to the client that connected.
  # client.puts "Greetings from #{STUDENT_1} and #{STUDENT_2}'s TCP server"
  # client.puts "Time is #{Time.now}"
  # client.puts "Goodbye from the past."
  input = client.gets.chomp.upcase

  case input
  when "RED HOT" then input_echo = "H-O-T!"
  when "DO IT AGAIN" then input_echo = "Go, Fight, Win"
  when "2 BITS" then input_echo = "Holler!"
  when "STOMP YOUR FEET" then input_echo = "STOMP!"
  end

  puts input_echo
  client.puts "#{input_echo}"

  # Send some logging information to the terminal again
  puts "Received #{input}"

  # Close the client connection
  client.close

  # Start the loop over so we can go back to `accept` and wait for a new client
end

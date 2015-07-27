require 'socket'

STUDENT_1 = "Ken"
STUDENT_2 = "Connor"

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
  # client.puts "We added a third line!"
  # message = client.gets.upcase
  input = client.gets.chomp
  puts "Received #{input}"
  case input
  when "RED HOT"
    client.puts "H-O-T!"
  when "DO IT AGAIN"
    client.puts "Go, Fight, Win"
  when "2 BITS"
    client.puts "Holler!"
  when "STOMP YOUR FEET"
    client.puts "STOMP!"
  else
    client.puts "Type in a valid message, dumbass!"
  end

  puts "#{client.peeraddr} wrote: "
  puts input
  # client.puts(message)
  # Send some logging information to the terminal again
  puts "We sent a greeting and the time. Closing connection."

  # Close the client connection
  client.close

  # Start the loop over so we can go back to `accept` and wait for a new client
end

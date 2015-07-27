require 'socket'

#TCPSocket is a class representing a connection to a TCP server.
#In the example below we will connect to the server on port 2000 of the machine '127.0.0.1'
# '127.0.0.1' is an address that _always_ points to your own machine,
# which is good since that's where our server will be running too.

server_connection = TCPSocket.new('10.1.10.131', 2000)

# Read a line from the server
# line_1 = server_connection.gets

# Read a second line from the server
# line_2 = server_connection.gets

# line_3 = server_connection.gets
server_connection.puts(ARGV.join(" "))


# line_5 = server_connection.gets

#Log out the first line we received from the server
# puts "Line 1: #{line_1}"

#Log out the second line we received from the server
# puts "Line 2: #{line_2}"

# puts "Line 3: #{line_3}"

# puts "Echo: " + server_connection.gets

puts "Response from server: " + server_connection.gets

#Close the connection if we're done
server_connection.close

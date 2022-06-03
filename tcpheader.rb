#the following code breaks down the tcp header from a packet captured from wireshark
tcpframe = "01bbc65f7b3d8f5c3f0eca99801000881c4d00000101050a3f0eca983f0eca99"
#split the after every 2 characters
tcparray= tcpframe.scan(/.{2}/)
#tcpframe = tcpframe.split()
puts tcparray.inspect
puts tcparray.length

#["01", "bb", "c6", "5f", "7b", "3d", "8f", "5c", "3f", "0e", "ca", "99", "80", "10", "00", "88", "1c", "4d", "00", "00", "01", "01", "05", "0a", "3f", "0e", "ca", "98", "3f", "0e", "ca", "99"]

#since now we have a array of each byte of the tcp header, we can now break it down
puts "source port: #{tcparray[0..1].join.to_i(16)}"
puts "destination port: #{tcparray[2..3].join.to_i(16)}"
puts "sequence number: #{tcparray[4..7].join.to_i(16)}"
puts "acknowledgement number: #{tcparray[8..11].join.to_i(16)}"
puts "data offset: #{tcparray[12].to_i(16)}"
puts "reserved: #{tcparray[13].to_i(16)}"
puts "flags: #{tcparray[14].to_i(16)}"
puts "window size: #{tcparray[15..16].join.to_i(16)}"
puts "checksum: #{tcparray[17..20].join.to_i(16)}"
puts "urgent pointer: #{tcparray[21..24].join.to_i(16)}"
puts "options: #{tcparray[25..-1].join.to_i(16)}"

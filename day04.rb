require 'digest'
my_key = open('day04_input.txt').read
message = Digest::MD5.hexdigest my_key
i = 0

# PART I
while message[0,5].to_s != "00000" do
  message = Digest::MD5.hexdigest (my_key+i.to_s)
  i+=1
end

print i-1

# PART II
message = Digest::MD5.hexdigest my_key
i = 0

while message[0,6].to_s != "000000" do
  message = Digest::MD5.hexdigest (my_key+i.to_s)
  i+=1
end

print i-1
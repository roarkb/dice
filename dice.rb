#!/usr/bin/env ruby

R0 = "     "
R1 = "  *  "
R2 = "*   *"
SIDES = {
  1 => [ R0, R1, R0 ],
  2 => [ R1, R0, R1 ],
  3 => [ R1, R1, R1 ],
  4 => [ R2, R0, R2 ],
  5 => [ R2, R1, R2 ],
  6 => [ R2, R2, R2 ],
}

def dice(a, b) 
  %Q{
   /       /   /       /
  +-------+   +-------+
  | #{a[0]} |   | #{b[0]} |
  | #{a[1]} |   | #{b[1]} |
  | #{a[2]} |/  | #{b[2]} |/
  +-------+   +-------+
  }
end

# Array.sample not supported until ruby 1.9
def random(array)
  array[rand(array.length)]
end

a = random(SIDES.keys)
b = random(SIDES.keys)
puts dice(SIDES[a], SIDES[b])

amount = a + b

if amount == 2
  puts "  you rolled snake eyes!\n\n"
else
  if [ 8, 11 ].include?(amount)
    word = "an"
  else
    word = "a"
  end

  puts "    you rolled #{word} #{amount}\n\n"
end

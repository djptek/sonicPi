# Welcome to Sonic Pi

# Welcome to Sonic Pi

define :riff do |n, p, q, r|
  use_synth :mod_sine
  play n
  sleep 0.5
  play p
  sleep 0.25
  play q
  sleep 0.75
  play r
  sleep 0.5
  #
  sleep 0.25
  play n
  sleep 0.5
  play p
  sleep 0.25
  play q
  sleep 0.5
  play r
  sleep 0.5
end

define :turnaround do |n, p, q, r|
  use_synth :mod_sine
  play n
  sleep 0.5
  play p
  sleep 0.25
  play n
  sleep 0.75
  play n
  sleep 0.5
  #
  sleep 0.25
  play q
  sleep 0.5
  play r
  sleep 0.25
  play q
  sleep 0.5
  play r
  sleep 0.5
end

#intro
4.times do
  riff :C2, :G1, :C2, :Eb2
end

#choruses

12.times do
  
  2.times do
    riff :C2, :G1, :C2, :Eb2
  end
  
  2.times do
    riff :F2, :C2, :F2, :Ab1
  end
  
  riff :C2, :G1, :C2, :Eb2
  
  turnaround :G2, :C2, :F2, :Eb2
  
  riff :C2, :G1, :C2, :Eb2
  
end

#outro
4.times do
  riff :C2, :G1, :C2, :Eb2
end


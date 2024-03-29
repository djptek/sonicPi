# Midnight Blue in Gm

define :riff do |n, o, p, q|
  in_thread do
    use_synth :sine
    play n
    sleep 0.5
    play o
    sleep 0.25
    use_synth :mod_sine
    play p
    sleep 0.75
    play q
    sleep 0.5
    #
    sleep 0.25
    use_synth :sine
    play n
    sleep 0.5
    play o
    sleep 0.25
    use_synth :mod_sine
    play p
    sleep 0.5
    play q
    sleep 0.5
  end
  sample :bd_808
  sleep 0.75
  sample :bd_ada, amp: 0.5
  sleep 0.75
  sample :bd_ada, amp: 0.5
  sleep 0.5
  sample :bd_ada, amp: 0.5
  sleep 0.75
  sample :bd_ada, amp: 0.5
  sleep 0.75
  sample :bd_808
  sleep 0.5
end

define :turnaround do |n, o|
  in_thread do
    use_synth :mod_fm
    play n
    sleep 0.75
    play n
    sleep 0.75
    play n
    sleep 0.50
    #
    sleep 0.25
    play o
    sleep 0.5
    play o
    sleep 0.25
    use_synth :mod_sine
    play o
    sleep 0.5
  end
  sample :bd_ada, amp: 0.5
  sleep 0.75
  sample :bd_ada, amp: 0.5
  sleep 0.75
  sample :bd_ada, amp: 0.5
  sleep 0.5
  sample :bd_ada, amp: 0.5
  sleep 0.75
  sample :bd_ada, amp: 0.5
  sleep 0.75
  sample :bd_ada, amp: 0.5
  sleep 0.25
  sample :bd_ada, amp: 0.5
  sleep 0.125
  sample :bd_ada, amp: 0.5
  sleep 0.125
end

sleep 4

#intro
4.times do
  riff :C2, :G1, :C2, :Eb2
end

#choruses

12.times do
  
  2.times do
    riff :C2, :G1, :C2, :Eb2
  end
  
  riff :F2, :C2, :F2, :C2
  
  riff :C2, :G1, :C2, :Eb2
  
  if one_in(2)
    turnaround :G1, :F1
  elsif one_in(2)
    turnaround :Bb1, :F1
  else
    turnaround :Bb1, :B1
  end
  
  riff :C2, :G1, :C2, :Eb2
  
end

#outro
4.times do
  riff :C2, :G1, :C2, :Eb2
end



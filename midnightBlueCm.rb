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
  sample :elec_tick, amp: 0.5
  sleep 0.75
  sample :elec_tick, amp: 0.5
  sleep 0.5
  sample :elec_tick, amp: 0.5
  sleep 0.75
  sample :elec_tick, amp: 0.5
  sleep 0.75
  sample :bd_808
  sleep 0.5
end

define :turnaround do |n, o|
  in_thread do
    use_synth :mod_fm
    play n, amp: 0.25
    sleep 0.75
    play n, amp: 0.25
    sleep 0.75
    play n, amp: 0.25
    sleep 0.50
    #
    sleep 0.25
    play o, amp: 0.25
    sleep 0.5
    play o, amp: 0.25
    sleep 0.25
    use_synth :mod_sine
    play o
    sleep 0.5
  end
  sample :bd_ada, amp: 0.25
  sleep 0.75
  sample :elec_tick, amp: 0.75
  sleep 0.75
  if one_in(2)
    sample :bd_ada, amp: 0.25
  else
    sample :elec_tick, amp: 0.75
  end
  sleep 0.5
  sample :elec_tick, amp: 0.75
  sleep 0.75
  if one_in(2)
    sample :bd_ada, amp: 0.25
  else
    sample :elec_tick, amp: 0.75
  end
  sleep 0.75
  sample :elec_tick, amp: 0.75
  sleep 0.25
  sample :elec_tick, amp: 0.75
  sleep 0.125
  sample :elec_tick, amp: 0.75
  sleep 0.125
end

sleep 4

#intro
4.times do
  riff :G1, :D1, :G1, :Bb1
end

#choruses

12.times do
  
  2.times do
    riff :G1, :D1, :G1, :Bb1
  end
  
  riff :C1, :Bb1, :C1, :Bb1
  
  riff :G1, :D1, :G1, :Bb1
  
  if one_in(2)
    turnaround :A1, :C1
  elsif one_in(2)
    turnaround :F1, :C1
  else
    turnaround :F1, :Gb1
  end
  
  riff :G1, :D1, :G1, :Bb1
  
end

#outro
4.times do
  riff :G1, :D1, :G1, :D1
end


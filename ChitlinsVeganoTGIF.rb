# Chitlins Vegano in Gm

define :riff do |n, o, p, q|
  in_thread do
    use_synth :sine
    play n, sustain: 0.25, release: 0.25, amp: 0.5
    sleep 0.5
    play o, release: 0.25
    sleep 0.25
    play p, sustain: 0.25, release: 0.5, amp: 0.5
    sleep 0.75
    play q, sustain: 0.25, release: 0.25, amp: 0.5
    sleep 0.5
    #
    sleep 0.25
    play n, sustain: 0.25, release: 0.25, amp: 0.5
    sleep 0.5
    play o, release: 0.25, amp: 0.5
    sleep 0.25
    play p, sustain: 0.25, release: 0.25, amp: 0.5
    sleep 0.5
    play q, sustain: 0.25, release: 0.25, amp: 0.5
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
    use_synth :sine
    play n, amp: 0.25
    sleep 0.75
    play n, amp: 0.25
    sleep 0.75
    play n, amp: 0.25
    sleep 0.50
    #use_synth :mod_sine
    sleep 0.25
    play o, amp: 0.25
    sleep 0.5
    play o, amp: 0.25
    sleep 0.25
    play o, amp: 0.33
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

define :accents do
  if one_in(7)
    sample :drum_splash_soft, amp: 0.75
  elsif one_in(5)
    sample :ambi_piano, release: 8
  elsif one_in(3)
    sample :bd_gas
  else
    sample :elec_tick
  end
end

#count in
1.times do
  sample :elec_tick, amp: 0.75
  sleep 0.5
  sample :elec_tick, amp: 0.75
  sleep 0.25
  sample :elec_tick, amp: 0.75
  sleep 0.75
  sample :elec_tick, amp: 0.75
  sleep 0.5
  #
  sleep 0.25
  sample :elec_tick, amp: 0.75
  sleep 0.5
  sample :elec_tick, amp: 0.75
  sleep 0.25
  sample :elec_tick, amp: 0.75
  sleep 0.5
  sample :elec_tick, amp: 0.75
  sleep 0.5
end


#intro
print "*** Intro"
2.times do
  in_thread do
    riff :C2, :G1, :C2, :Eb2
    riff :C2, :G1, :C2, :Eb2
  end
  accents
  sleep 8
end

#choruses

12.times do
  print "*** Chorus"
  print "*** Cm7"
  in_thread do
    2.times do
      riff :C2, :G1, :C2, :Eb2
    end
  end
  play chord(:C4, :m7)
  # wait for 2 x riff
  sleep 8
  
  print "*** Fm7"
  in_thread do
    riff :G1, :Eb2, :G1, :Eb2
  end
  if one_in(2)
    play chord(:F4, :m7), release: 8
  end
  # wait for 1 x riff
  sleep 4
  
  print "*** Cm7"
  riff :C2, :G1, :C2, :Eb2
  
  print "*** Turnaround"
  if one_in(2)
    turnaround :G1, :F1
  elsif one_in(2)
    turnaround :Bb2, :F1
  else
    turnaround :Bb2, :B2
  end
  
  in_thread do
    riff :C2, :G1, :C2, :Cb2
  end
  sleep 3
  print "*** ... and ...."
  if one_in(2)
    play chord(:Db4, :dom7)
    sleep 0.75
    play chord(:C4, :m7)
    sleep 0.25
  elsif one_in(2)
    play chord(:B4, :m9)
    sleep 0.75
    play chord(:C4, :m9)
    sleep 0.25
  else
    play chord(:Db4, :dim7)
    sleep 0.5
    play chord(:C4, :dim7)
    sleep 0.5
  end
  
end

#outro
print "*** Outro"
4.times do
  sample :drum_splash_soft, amp: 0.75
  riff :C2, :A2, :C2, :A2
end


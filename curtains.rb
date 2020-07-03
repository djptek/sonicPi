define :drum1 do
  [[:bd_klub,1],[:elec_tick,1],
  [:bd_klub,1],[:bd_klub,0.5],[:elec_tick,0.5]].each {|sa_sl|
    sample sa_sl[0], amp: 1
    sleep sa_sl[1]
  }
end

define :drum2 do
  [[:bd_klub,1],[:bd_klub,1],
  [:bd_klub,1],[:bd_klub,0.5],[:elec_tick,0.5]].each {|sa_sl|
    sample sa_sl[0], amp: 1
    sleep sa_sl[1]
  }
end

define :drum3 do
  7.times do
    with_fx :echo do
      sample :bd_klub, amp: 1
      sleep 1
    end
  end
  2.times do
    with_fx :echo do
      sample :bd_klub, amp: 1
      sleep 0.5
    end
  end
end

define :drum4 do
  3.times do
    with_fx :echo do
      sample :bd_klub, amp: 1
      sleep 0.75
    end
    sample :bd_klub, amp: 1
    sleep 0.25
    sample :elec_tick, amp: 1
    sleep 1
  end
  with_fx :echo do
    sample :bd_klub, amp: 1
    sleep 1
  end
  2.times do
    with_fx :echo do
      sample :elec_tick, amp: 1
      sample :bd_klub, amp: 1
      sleep 0.5
    end
  end
end

define :intro do
  in_thread do
    2.times do
      drum1
      drum2
    end
  end
  use_synth :dpulse
  2.times do
    [[:D1,0.5],[:D2,0.5],[:D3,0.5],[:D3,0.5],
     [:F2,0.5],[:F3,0.5],[:D2,0.5],[:D3,0.5],
     [:Bb2,0.5],[:Bb2,0.5],[:Bb3,0.5],[:D3,0.5],
    [:A2,0.5],[:A2,0.5],[:A3,0.5],[:D3,0.5]].each {|n_d|
      print "Bass ["+n_d[0].to_s+"]"
      #use_synth :dpulse
      #play n_d[0], release: n_d[1]*2, amp: 0.25
      use_synth :sine
      play n_d[0], release: n_d[1]*2, amp: 1
      use_synth :saw
      play n_d[0], release: n_d[1]*2, amp: 0.05
      sleep n_d[1]
    }
  end
end

define :verse do
  8.times do
    in_thread do
      2.times do
        if one_in(3)
          drum1
        else
          drum2
        end
      end
    end
    in_thread do
      [[:D1,0.5],[:D2,0.5],[:D3,0.5],[:D3,0.5],
       [:F2,0.5],[:F3,0.5],[:D2,0.5],[:D3,0.5],
       [:Bb2,0.5],[:Bb2,0.5],[:Bb3,0.5],[:D3,0.5],
      [:A2,0.5],[:A2,0.5],[:A3,0.5],[:D3,0.5]].each {|n_d|
        print "Bass ["+n_d[0].to_s+"]"
        use_synth :sine
        play n_d[0], release: n_d[1]*2, amp: 1
        use_synth :saw
        play n_d[0], release: n_d[1]*2, amp: 0.05
        sleep n_d[1]
      }
    end
    [[:D4,[:minor,:minor7]],
     [:D4,[:minor,:minor7]],
     [:Bb3,[:major,:major7]],
    [:A3,['7sus4','7sus2']]].each {|t_n|
      t = t_n[0]
      n = t_n[1][rrand_i(0,1)]
      #n = t_n[1][1]
      print t, n
      #play chord(t_n[0],t_n[1[rrand_i(0,2)]])
      if one_in(7)
        use_synth :sine
        play chord(t, n), release: 4, amp: 0.5
        use_synth :dpulse
        play chord(t, n), release: 2, amp: 0.1
      end
      sleep 2
    }
  end
end

define :bridge do
  in_thread do
    3.times do
      drum3
    end
  end
  use_synth :sine
  [[:Bb2,1],[:Bb2,1],[:Bb2,1],[:Bb2,1],[:Bb2,1],[:Bb2,1],[:A2,1],[:A2,1],
   [:D2,1],[:D2,1],[:D2,1],[:Ab2,1],[:G2,1],[:G2,1],[:G2,1],[:G2,1],
  [:Bb2,1],[:Bb2,1],[:Bb2,1],[:Bb2,1],[:A2,1],[:A2,1],[:Db2,1],[:Db2,1]].each {|n_d|
    print "Bass ["+n_d[0].to_s+"]"
    play n_d[0], release: n_d[1]*2, amp: 1.0
    sleep n_d[1]
  }
end

define :thebreak do
  in_thread do
    2.times do
      drum4
    end
  end
  [[:D1,0.5],[:D2,0.5],[:D1,0.5],[:D2,0.5],
   [:D1,0.5],[:D2,0.5],[:D1,0.5],[:D2,0.5],
   [:G1,1],[:G1,1],[:G1,1],[:G1,1],
   [:D1,0.5],[:D2,0.5],[:D1,0.5],[:D2,0.5],
   [:D1,0.5],[:D2,0.5],[:D1,0.5],[:D2,0.5],
   [:G1,1],[:G1,1],[:G1,1],[:G1,1],
   [:D1,0.5],[:D2,0.5],[:D1,0.5],[:D2,0.5],
   [:D1,0.5],[:D2,0.5],[:D1,0.5],[:D2,0.5],
  [:G1,1],[:G1,1],[:G1,1],[:G1,1]].each {|n_d|
    print "Bass ["+n_d[0].to_s+"]"
    use_synth :sine
    play n_d[0], release: n_d[1]*2, amp: 1
    use_synth :saw
    play n_d[0], release: n_d[1]*2, amp: 0.1
    sleep n_d[1]
  }
end

define :aca do
  2.times do drum3
  end
end

define :bye do
  with_fx :echo do
    use_synth :sine
    play :D2, attack:1, release: 2, amp: 1
    use_synth :mod_saw
    play :D1, attack:1, sustain: 1, decay: 2, release: 1, amp: 0.1
    sleep 8
  end
end

#main
with_bpm 120 do
  intro
  2.times do
    verse
    bridge
  end
  thebreak
  verse
  bridge
  verse
  aca
  intro
  bye
end




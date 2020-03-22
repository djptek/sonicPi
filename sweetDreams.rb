define :drum1 do
  [[:bd_klub,1],[:elec_tick,1],
  [:bd_klub,1],[:bd_klub,0.5],[:elec_tick,0.5]].each {|sa_sl|
    sample sa_sl[0], amp: 2
    sleep sa_sl[1]
  }
end

define :drum2 do
  [[:bd_klub,1],[:bd_klub,1],
  [:bd_klub,1],[:bd_klub,0.5],[:elec_tick,0.5]].each {|sa_sl|
    sample sa_sl[0], amp: 2
    sleep sa_sl[1]
  }
end

define :drum3 do
  [[:bd_klub,1],[:bd_klub,1],
  [:bd_klub,1],[:bd_klub,0.5],[:elec_tick,0.5]].each {|sa_sl|
    sample sa_sl[0], amp: 2
    sleep sa_sl[1]
  }
end

define :intro do
  in_thread do
    2.times do
      drum1
      drum2
    end
  end
  use_synth :saw
  2.times do
    [[:D1,0.5],[:D2,0.5],[:D3,0.5],[:D3,0.5],
     [:F2,0.5],[:F3,0.5],[:D2,0.5],[:D3,0.5],
     [:Bb2,0.5],[:Bb2,0.5],[:Bb3,0.5],[:D3,0.5],
    [:A2,0.5],[:A2,0.5],[:A3,0.5],[:D3,0.5]].each {|n_d|
      print "Bass ["+n_d[0].to_s+"]"
      play n_d[0], release: n_d[1]*2, amp: 0.5
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
      use_synth :saw
      [[:D1,0.5],[:D2,0.5],[:D3,0.5],[:D3,0.5],
       [:F2,0.5],[:F3,0.5],[:D2,0.5],[:D3,0.5],
       [:Bb2,0.5],[:Bb2,0.5],[:Bb3,0.5],[:D3,0.5],
      [:A2,0.5],[:A2,0.5],[:A3,0.5],[:D3,0.5]].each {|n_d|
        print "Bass ["+n_d[0].to_s+"]"
        play n_d[0], release: n_d[1]*2, amp: 0.5
        sleep n_d[1]
      }
    end
    [[:D4,[:minor,:minor7]],
     [:D4,[:minor,:minor7]],
     [:Bb3,[:major,:major7]],
    [:A3,['7sus4','7sus2']]].each {|t_n|
      t = t_n[0]
      #n = t_n[1][rrand_i(0,1)]
      n = t_n[1][1]
      print t, n
      #play chord(t_n[0],t_n[1[rrand_i(0,2)]])
      if one_in(7)
        use_synth :sine
        play chord(t, n), release: 5
      end
      sleep 2
    }
  end
end

define :bridge do
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
    use_synth :saw
    [[:D1,0.5],[:D2,0.5],[:D3,0.5],[:D3,0.5],
     [:F2,0.5],[:F3,0.5],[:D2,0.5],[:D3,0.5],
     [:Bb2,0.5],[:Bb2,0.5],[:Bb3,0.5],[:D3,0.5],
    [:A2,0.5],[:A2,0.5],[:A3,0.5],[:D3,0.5]].each {|n_d|
      print "Bass ["+n_d[0].to_s+"]"
      play n_d[0], release: n_d[1]*2, amp: 0.5
      sleep n_d[1]
    }
  end
  [[:D4,[:minor,:minor7]],
   [:D4,[:minor,:minor7]],
   [:Bb3,[:major,:major7]],
  [:A3,['7sus4','7sus2']]].each {|t_n|
    t = t_n[0]
    #n = t_n[1][rrand_i(0,1)]
    n = t_n[1][1]
    print t, n
    #play chord(t_n[0],t_n[1[rrand_i(0,2)]])
    if one_in(7)
      use_synth :sine
      play chord(t, n), release: 5
    end
    sleep 2
  }
end
end

with_bpm 120 do
  intro
  verse
end



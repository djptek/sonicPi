# Welcome to Sonic Pi
#intro
define :intro do
  print "*** INTRO *** "
  [true, false].each {|first_time|
    # bassline
    use_synth :prophet
    in_thread do
      [:F2,:Db2,:Eb2,:Bb3].each {|t|
        play t, decay: 2, amp: 0.5
        sleep 4
      }
    end
    # chords
    use_synth :saw
    in_thread do
      play chord(:F3, :minor), release: 4
      sleep 4
      play chord(:Db3, :major7), release: 4
      sleep 4
      play chord(:Eb3, :sus2), release: 4
      sleep 4
      play chord(:Bb3, :sus4), release: 2
      sleep 2
      if first_time
        play chord(:Bb3, :minor), release: 2
      else
        play chord(:Bb3, :major), release: 2
      end
      sleep 2
    end
    # continuo
    use_synth :prophet
    play :G5, release: 1
    sleep 0.5
    play :Ab6, release: 1
    sleep 0.5
    play :C5, release: 1
    sleep 0.5
    play :G5, release: 2
    sleep 1
    play :Ab6, release: 3
    sleep 1.5
    #
    if first_time
      play :G5, release: 1
      sleep 0.5
      play :Ab6, release: 1
      sleep 0.5
    else
      play :Ab6, release: 1
      sleep 0.5
      play :G5, release: 1
      sleep 0.5
    end
    play :C5, release: 1
    sleep 0.5
    play :Ab6, release: 2
    sleep 1
    play :G5, release: 1
    sleep 1
    play :Bb5, release: 1
    sleep 0.5
    #
    play :F5, release: 1
    sleep 0.5
    play :G5, release: 1
    sleep 0.5
    play :Bb5, release: 1
    sleep 0.5
    play :F5, release: 2
    sleep 1
    play :G5, release: 2
    sleep 1
    play :Bb5, release: 1
    sleep 0.5
    #
    play :Eb5, release: 4
    sleep 2
    if first_time
      play :Db5, release: 4
    else
      in_thread do
        play :D5, release: 4
      end
      play :Bb5, release: 4
    end
    sleep 2
  }
end

#verse
define :verse do
  print "*** VERSE *** "
  # bassline
  use_synth :prophet
  in_thread do
    [[:F2,2],[:F2,2],[:F2,2],[:F2,2],
     [:Eb2,2],[:Eb2,2],[:Bb2,4],
     [:F2,2],[:F2,2],[:Db2,2],[:Db2,2],
     [:Eb2,2],[:Eb2,2],[:F2,3],[:F2,0.5],[:C2,0.5],
     [:F2,2],[:F2,2],[:Db2,2],[:Db2,2],
     [:Eb2,2],[:Eb2,2],[:F2,2],[:F2,2],
     [:F2,2],[:F2,1.5],[:Eb2,0.5],[:Eb2,4.5],
    [:Bb2,4],[:Bb2,4]].each {|n_d|
      print "Bass ["+n_d[0].to_s+"]"
      play n_d[0], release: n_d[1]*2, amp: 0.5
      sleep n_d[1]
    }
  end
  # chords
  use_synth :saw
  [[:F3,'5',4],[:Db3,'5',4],
   [:Eb3,:major,4],[:Bb3,:sus4,2],[:Bb3,:minor,2],
   [:F3,:minor,4],[:Db3,:major7,4],
   [:Eb3,'5',4],[:Bb3,:sus4,2],[:Bb3,:major,2],
   [:F3,:minor,4],[:Db3,:major7,4],
   [:Eb3,:sus2,4],[:Bb3,:sus4,2],[:Bb3,:minor,2],
   [:F3,'5',4],[:Eb3,:'5',4],
  [:Bb3,:major,2],[:Bb3,'9sus4',2],[:Bb3,:major,4]].each {|t_n_d|
    print "Chord ["+t_n_d[0].to_s+t_n_d[1].to_s+"]"
    play chord(t_n_d[0], t_n_d[1]), release: t_n_d[2]
    sleep t_n_d[2]
  }
end

with_bpm 120 do
  in_thread do
    loop do
      sample :bd_klub, amp: 2
      sleep 1
      sample :bd_klub, amp: 2
      sample :elec_tick, amp: 2
      sleep 1
      sample :bd_klub, amp: 2
      sleep 1
      sample :bd_klub, amp: 2
      sleep 0.5
      sample :elec_tick, amp: 2
      sleep 0.5
    end
  end
  intro
  verse
end

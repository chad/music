define :quiet_drums do
  sample :drum_bass_soft, amp: 1
  sample :drum_cymbal_closed, amp: 0.5
  sample :drum_snare_soft, amp: 0.5
  sleep 0.25
  sample :drum_cymbal_closed, amp: 0.5
  sleep 0.25
  sample :drum_cymbal_closed, amp: 0.5
  sample :drum_snare_soft, amp: 0.5
  sleep 0.25
  sample :drum_cymbal_closed, amp: 0.5
  sleep 0.25
  sample :drum_cymbal_closed, amp: 0.5
  sample :drum_snare_soft, amp: 0.5
  sleep 0.25
  sample :drum_cymbal_closed, amp: 0.5
  sleep 0.25
  sample :drum_cymbal_closed, amp: 0.5
  sample :drum_snare_soft, amp: 0.5
  sleep 0.25
  sample :drum_cymbal_closed, amp: 0.5
  sample :drum_bass_soft, amp: 1
  sleep 0.25
end

define :fast_hat do
  sample :drum_cymbal_closed, amp: 0.5
  sleep 0.125
  sample :drum_cymbal_closed, amp: rand((0.5)..1)
  sleep 0.125
  sample :drum_cymbal_closed, amp: 0.5
  sleep 0.125
  sample :drum_cymbal_closed, amp: rand((0.5)..1)
  sleep 0.125
  sample :drum_cymbal_closed, amp: 0.5
  sleep 0.125
  sample :drum_cymbal_closed, amp: rand((0.5)..1)
  sleep 0.125
  sample :drum_cymbal_closed, amp: 0.5
  sleep 0.125
  sample :drum_cymbal_closed, amp: rand((0.5)..1)
  sleep 0.125
end

define :back_beat do
  sample :drum_bass_hard
  sleep 0.5
  sample :drum_snare_hard
  sleep 0.5
  sample :drum_bass_hard
  sleep 0.25
  sample :drum_bass_hard
  sleep 0.25
  sample :drum_snare_hard
  sleep 0.5
end

define :faster_drums do
  in_thread do
    fast_hat
  end
  in_thread do
    back_beat
  end
  sleep 1
end

live_loop :partay do
  with_fx :flanger do
    with_fx :reverb ,room: 0.2 do
      quiet_drums
      ##| faster_drums
    end
  end
end

live_loop :verse_bass do
  with_fx :echo, decay: 1, mix: 0.4 do
    sample :bass_thick_c, rpitch: -9, sustain: 0.1, attack: 0.01
    sleep 0.25
    sample :bass_thick_c, rpitch: -7, sustain: 0.1, attack: 0.01
    sleep 0.25
    sample :bass_thick_c, rpitch: -4, sustain: 0.1, attack: 0.01
    sleep 0.25
    sample :bass_thick_c, rpitch: -2, sustain: 0.1, attack: 0.01
    sleep 0.25
    sleep 3
  end
end

chords = ring(chord(:bf, :minor7, invert: -1),
              chord(:fs, :maj),
              chord(:g, :diminished),
              chord(:bf, :minor7))

live_loop :pad do
  use_synth :prophet
  with_fx :wobble, phase: 2, invert_wave: 1, wave: 0, cutoff_max: 80, cutoff_min: 60 do
    
    with_fx :reverb, room: 1 do
      with_fx :bitcrusher, mix: 0.4 do
        play_chord chords.tick, sustain: 1, amp: 0.8
        sleep 4
      end
    end
    
  end
end





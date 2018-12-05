# Coded by Sam Aaron
use_bpm 60

in_thread do
  with_fx :wobble, phase: 1, invert_wave: 1, wave: 0, cutoff_max: 80, cutoff_min: 60 do
    synth :blade, note: :bf1, release: 4, cutoff: 110, amp: 1, pitch_shift: 0
    sleep 4
    synth :blade, note: :f1, release: 4, cutoff: 110, amp: 1, pitch_shift: 0
    sleep 1
    synth :blade, note: :ef1, release: 4, cutoff: 110, amp: 1, pitch_shift: 0
    sleep 3
    synth :blade, note: :df1, release: 4, cutoff: 110, amp: 1, pitch_shift: 0
    
    
  end
end
sleep 1.5

in_thread do
  play 58
  sleep 0.5
  play 60
  sleep 0.5
  play 62
  sleep 0.5
  play 58
  sleep 0.5
  play 53
  sleep 0.5
  play 57
  sleep 1
  play 55
  sleep 3
end

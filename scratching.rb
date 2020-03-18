# Welcome to Sonic Pi

4.times do
  sample :ambi_choir, rate: (rrand 0.125, 1.5)
  sleep rrand(0.2, 2)
end

sample :vinyl_scratch
sleep 0.5
sample :vinyl_scratch
sleep 0.5
sample :vinyl_scratch
sleep 0.0625
sample :vinyl_scratch

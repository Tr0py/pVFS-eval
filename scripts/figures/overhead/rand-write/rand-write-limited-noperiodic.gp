set terminal pdfcairo  transparent enhanced font ",16" fontscale 0.5 size 6.00in, 4.00in
set output 'rand-write-limited-noperiodic.pdf'
set title "Random Write | Limited Dirty, No Periodic Flush"
set xlabel "File Size (MB)" 
set ylabel "Operations Per Second (Mops/sec)" 
plot './results-limited-noperiodic/ssd-result.csv' us 1:2 ti "SSD" w linespoints lw 2, './results-limited-noperiodic/hdd-result.csv' us 1:2 ti "HDD" w linesp lw 2, './results-limited-noperiodic/dram-result.csv' us 1:2 ti "DRAM" w linesp lw 2

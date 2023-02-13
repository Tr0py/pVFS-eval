set term pdfcairo font ",16" size 6in,4in
set output 'rand-write-fsync.pdf'
fsync_freq=1000000
set xlabel "File Size (MB)"
set ylabel "Operation Per Second (Mops/s)"
set title "SSD with fsync() for every N ops"
plot for [fsync_freq in "1000000 100000000 1000000000 100000000000 10000000000000"] "./results-".fsync_freq."/results/ssd-result.csv" us 1:2 ti "SSD-".fsync_freq w linespoints lw 2, \
	"./results-100000000000/results/dram-result.csv" us 1:2 ti "dram" w linespoints lw 2

set title "HDD with fsync() for every N ops"
plot for [fsync_freq in "1000000 100000000 1000000000 100000000000 10000000000000"] "results-".fsync_freq."/results/hdd-result.csv" us 1:2 ti "HDD-".fsync_freq w linespoints lw 2, \
	"./results-100000000000/results/dram-result.csv" us 1:2 ti "dram" w linespoints lw 2

set term pdfcairo font ",16" size 6in,4in
set output 'rand-write-fsync-all.pdf'
fsync_freq=1000000
set xlabel "File Size (MB)"
set ylabel "Operation Per Second (Mops/s)"
set title "Rand Write with fsync() for every N ops"

set linetype  1 lc rgb "dark-violet" lw 2
set linetype  2 lc rgb "dark-violet" lw 2
set linetype  3 lc rgb "dark-red" lw 2
set linetype  4 lc rgb "dark-red" lw 2
set linetype  5 lc rgb "orange" lw 2
set linetype  6 lc rgb "orange" lw 2
set linetype  7 lc rgb "blue" lw 2
set linetype  8 lc rgb "blue" lw 2
set linetype  9 lc rgb "dark-yellow" lw 2
set linetype  10 lc rgb "dark-yellow" lw 2
set linetype  11 lc rgb "black"   lw 2
set linetype  12 lc rgb "gray50"  lw 2

plot for [fsync_freq in "1000000 100000000 1000000000 100000000000 10000000000000"] \
		for [disk in "hdd ssd"] \
			"./results-".fsync_freq."/results/".disk."-result.csv" us 1:2 ti disk."-".fsync_freq w linespoints lw 2,\
	"./results-100000000000/results/dram-result.csv" us 1:2 ti "dram" w linespoints lw 2

set linetype  1 lc rgb "dark-violet" lw 2
set linetype  2 lc rgb "dark-green" lw 2
set linetype  3 lc rgb "black" lw 2

do for [fsync_freq in "1000000 100000000 1000000000 100000000000 10000000000000"] {
	set title "Rand Write with fsync() for every ".fsync_freq." ops"
	plot for [disk in "hdd ssd"] \
			"./results-".fsync_freq."/results/".disk."-result.csv" us 1:2 ti disk."-".fsync_freq w linespoints lw 2,\
	"./results-100000000000/results/dram-result.csv" us 1:2 ti "dram" w linespoints lw 2
}

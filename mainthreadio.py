import json
import numpy

def clean(s):
    return normalize(s).translate(None, ",")

def normalize(s):
    if type(s) == unicode:
        return s.encode('utf8', 'ignore')
    else:
        return str(s)

def map(k, d, v, cx):
    global n_pings
    parsed = json.loads(v)

    if not "fileIOReports" in parsed:
        return

    for f, arr in parsed["fileIOReports"].iteritems():
        cx.write(clean(f), arr)

def setup_reduce(cx):
    cx.field_separator = ","

def reduce(k, v, cx):
    totals = []
    avgs = []
    counts = []
    n_opens = []
    n_reads = []
    n_writes = []
    n_fsyncs = []
    n_stats = []

    for total, n_open, n_read, n_write, n_fsync, n_stat in v:
        totals.append(total)
        n_opens.append(n_open)
        n_reads.append(n_read)
        n_writes.append(n_write)
        n_fsyncs.append(n_fsync)
        n_stats.append(n_stat)

        count = n_open + n_read + n_write + n_fsync + n_stat
        avgs.append(total/count if count > 0 else 0)
        counts.append(count)

    # Output fields:
    cx.write(k, ",".join([str(len(v)), str(numpy.median(avgs)), str(numpy.median(count))]))

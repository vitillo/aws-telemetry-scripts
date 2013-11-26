def map(k, d, v, cx):
    j = json.loads(v)
    disk = j['info'].get('profileHDDModel', "N\A")
    cx.write(disk, 1)

def reduce(k, v, cx):
    cx.write(k, sum(v))

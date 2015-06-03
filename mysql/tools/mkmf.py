#!/usr/bin/python


fh = open('model_feature.csv', 'w')

start=1000
end=10000
step=1000

for i in range(start, end, step):
    for f in range(1, 513):
        items = ['\N', i, 1, f, '\N', 'etl']
        fh.write('{}\t{}\t{}\t{}\t{}\t{}\n'.format(*items))

fh.close()

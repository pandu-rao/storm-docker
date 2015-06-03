#!/usr/bin/python


fh = open('feature.csv', 'w')

for f in range(0, 512):
    items = ['\N', 1, 'key.{}'.format(f), 'value.{}'.format(f), 'boolean', f]
    fh.write('{}\t{}\t{}\t{}\t{}\t{}\n'.format(*items))

fh.close()

import os
import datetime

filename = str(datetime.datetime.now()).split('.')[0]

os.system(f'grim ~/Pictures/"{filename}".png')

os.system(f'wl-copy < ~/Pictures/"{filename}".png')

os.system("notify-send 犯罪证据已保存～嘿嘿♡~")

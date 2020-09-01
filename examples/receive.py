import cv2
import numpy as np
from pysimplendi import NDIReceiver

if __name__ == '__main__':
    receiver = NDIReceiver()
    source_list = receiver.getSourceList()

    for s in source_list:
        print(s)

    if len(source_list) > 0:
        receiver.setSource(source_list[0])

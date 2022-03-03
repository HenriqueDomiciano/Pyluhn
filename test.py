from pyluhn import Luhn as l
from pyluhnc import Luhn as lc
import time
import random
times = []
t1,t2 =0,0
m = l(6771549495586802)
print(m.verification)
print(m.verify())

import datetime

d1 = datetime.date(2011, 2, 14)
d2 = datetime.date.today()

delta = d2 - d1
print delta.days

from PyPDF2 import PdfWriter, PdfReader
import io
from reportlab.pdfgen import canvas
from reportlab.lib.pagesizes import letter
import datetime
from dateutil.relativedelta import relativedelta


#print(datetime.date.today())
DT=datetime.date.today()
x=str(DT)
one_month_ago = DT - relativedelta(months=1)
y=str(one_month_ago)

last_month = DT.replace(day=1) + datetime.timedelta(days=DT.day)
packet = io.BytesIO()
can = canvas.Canvas(packet, pagesize=letter)
can.drawString(450, 650, x )
can.drawString(267, 417, y )
can.drawString(65, 400, x )

can.save()

#move to the beginning of the StringIO buffer
packet.seek(0)

# create a new PDF with Reportlab
new_pdf = PdfReader(packet)
# read your existing PDF
existing_pdf = PdfReader(open("gst_invoice.pdf", "rb"))
output = PdfWriter()
# add the "watermark" (which is the new pdf) on the existing page
page = existing_pdf.pages[0]
page.merge_page(new_pdf.pages[0])
output.add_page(page)
# finally, write "output" to a real file
output_stream = open("destination.pdf", "wb")
output.write(output_stream)
output_stream.close()
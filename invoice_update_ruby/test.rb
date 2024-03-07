require 'hexapdf'
require 'date'
# Open an existing PDF file
class PdfEditor
    def self.edit_pdf(pdf_file)
        unless pdf_file.end_with?('.pdf')
            raise StandardError, "Invalid file format: #{pdf_file} is not a PDF file"
        end
        doc = HexaPDF::Document.open('GSTinvoice.pdf')

    # Access the first page of the PDF
        page1 = doc.pages[0]
    # Access the contents of the page
        content = page1.contents


        # Modify the contents by adding text
        #contents << "BT /F1 40 Tf 2000 850 Td (NAMASTE) ET\n"
        # Get the current date
        #current_date = Time.now.strftime("%Y-%M-%D")

        rotation_angle = 180
        reflecting_angle = 0
        vertical_angle=0
        # Calculate the text width and height
        text_width = 100  # Adjust as needed
        text_height = 40  # Adjust as needed
        d = Date.today.prev_month # or Date.today.next_month, depending what you want

        puts(d)
        # Modify the contents by adding the current date
        content <<  "q\n1 0 0 1 1350 725 cm\n#{Math.cos(vertical_angle * Math::PI / 180)} #{Math.sin(vertical_angle * Math::PI / 180)} -#{Math.sin(reflecting_angle * Math::PI / 180)} #{Math.cos(rotation_angle* Math::PI / 180)} 500 100 Tm\n/Helvetica 50 Tf\n0 0 Td\n(#{Date.today}) Tj\nQ\n"
        content <<  "q\n1 0 0 1 175 1770 cm\n#{Math.cos(vertical_angle * Math::PI / 180)} #{Math.sin(vertical_angle * Math::PI / 180)} -#{Math.sin(reflecting_angle * Math::PI / 180)} #{Math.cos(rotation_angle* Math::PI / 180)} 100 100 Tm\n/Helvetica 50 Tf\n0 0 Td\n(#{Date.today}) Tj\nQ\n"
        content <<  "q\n1 0 0 1 610 1705 cm\n#{Math.cos(vertical_angle * Math::PI / 180)} #{Math.sin(vertical_angle * Math::PI / 180)} -#{Math.sin(reflecting_angle * Math::PI / 180)} #{Math.cos(rotation_angle* Math::PI / 180)} 500 100 Tm\n/Helvetica 50 Tf\n0 0 Td\n(#{d}) Tj\nQ\n"

        # Update the page with the modified contents
        #page.contents = contents
        

        page1.contents= content
        # Save the modified PDF
        doc.write("output.pdf")
        # Save the modified PDF
        #doc.write('modified_1.pdf')
    end
end
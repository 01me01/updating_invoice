# spec/pdf_editor_spec.rb

require_relative '../test.rb' # assuming pdf_editor.rb is your code file

RSpec.describe PdfEditor do
  describe 'edit_pdf' do
    it 'modifies a simple PDF file' do
      # Prepare input PDF file
      input_pdf = 'GSTinvoice.pdf'
      # Run the code to edit the PDF file
      PdfEditor.edit_pdf(input_pdf)
      # Check the output PDF file and assert its content
      expect(File.exist?('output.pdf')).to be true
      # Additional assertions as needed
    end

    it 'handles large PDF files' do
      # Prepare input PDF file
      large_pdf = 'large.pdf'
      # Run the code to edit the large PDF file
      PdfEditor.edit_pdf(large_pdf)
      # Check the output PDF file and assert its content
      expect(File.exist?('output.pdf')).to be true
      # Additional assertions as needed
    end

    # Add more test cases following a similar structure for other scenarios

    it 'handles invalid file format' do
        invalid_file = 'invalid_file.txt'
        
        # Create an invalid file (not a PDF)
        File.write(invalid_file, 'This is not a PDF file content')
  
        # Expect an error to be raised when attempting to edit the invalid file
        expect { PdfEditor.edit_pdf(invalid_file) }.to raise_error(StandardError)
        
        # Clean up - delete the invalid file after the test
        File.delete(invalid_file) if File.exist?(invalid_file)
    end
  end
end

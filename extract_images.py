import fitz
import os

pdf_path = "CBS_Premium_Brochure_v2.pdf"
output_dir = "extracted_images"
if not os.path.exists(output_dir):
    os.makedirs(output_dir)

doc = fitz.open(pdf_path)
image_count = 0

for i in range(len(doc)):
    for img in doc.get_page_images(i):
        xref = img[0]
        base_image = doc.extract_image(xref)
        image_bytes = base_image["image"]
        image_ext = base_image["ext"]
        image_filename = os.path.join(output_dir, f"image{image_count}.{image_ext}")
        with open(image_filename, "wb") as image_file:
            image_file.write(image_bytes)
        print(f"Extracted {image_filename}")
        image_count += 1

print(f"Total images extracted: {image_count}")

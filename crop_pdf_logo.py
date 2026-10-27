import fitz
import os

pdf_path = "CBS_Premium_Brochure_v2.pdf"
doc = fitz.open(pdf_path)

# Render the first page at a higher resolution
page = doc.load_page(0)
pix = page.get_pixmap(dpi=300)

# The logo is usually at the top. Let's crop the top part.
# The page size is typically around 595x842 points.
# We crop x0, y0, x1, y1
w = page.rect.width
h = page.rect.height

# Let's crop the top 15% where the logo is usually located
clip_rect = fitz.Rect(0, 0, w, h * 0.15)
pix_cropped = page.get_pixmap(dpi=300, clip=clip_rect)

# Save to the image paths
pix_cropped.save("src/main/webapp/images/cbs-logo.png")
pix_cropped.save("frontend/image/cbs-logo.png")
print("Saved logo from PDF")

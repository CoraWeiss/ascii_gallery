#!/bin/bash

# Create directory for ASCII outputs if it doesn't exist
mkdir -p ascii_outputs

# Convert each jpg and save its ASCII version
for img in *.jpg; do
    jp2a --width=80 "$img" > "ascii_outputs/${img%.*}_ascii.txt"
    echo "Converted $img"
done

# Create the HTML file with a placeholder for content
cat > index.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Christmas Freud ASCII Gallery</title>
    <style>
        body {
            background-color: #1a1a1a;
            color: #33ff33;
            font-family: 'Courier New', Courier, monospace;
            padding: 20px;
        }
        .ascii-container {
            background: #000;
            padding: 15px;
            margin: 20px;
            border-radius: 8px;
        }
        .ascii-title {
            color: #fff;
            text-align: center;
            margin-bottom: 10px;
        }
        pre {
            white-space: pre;
            overflow-x: auto;
        }
    </style>
</head>
<body>
    <h1>Christmas Freud ASCII Gallery</h1>
    <div class="gallery">
EOF

# Append each ASCII file to the HTML
for ascii_file in ascii_outputs/*_ascii.txt; do
    filename=$(basename "$ascii_file" _ascii.txt)
    echo "<div class='ascii-container'>" >> index.html
    echo "<div class='ascii-title'>$filename</div>" >> index.html
    echo "<pre>" >> index.html
    cat "$ascii_file" >> index.html
    echo "</pre>" >> index.html
    echo "</div>" >> index.html
done

# Close the HTML file
cat >> index.html << 'EOF'
    </div>
</body>
</html>
EOF

echo "Gallery built! Check index.html"

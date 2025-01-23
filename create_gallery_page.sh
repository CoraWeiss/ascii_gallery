#!/bin/bash

echo '<!DOCTYPE html>
<html>
<head>
    <title>ASCII Art Gallery</title>
    <style>
        body {
            background-color: #000000;
            color: #00ff00;
            font-family: "Courier New", monospace;
            padding: 20px;
            max-width: 1200px;
            margin: 0 auto;
        }
        .gallery {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            padding: 20px;
        }
        .ascii-container {
            background: #0a0a0a;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0,255,0,0.1);
            border: 1px solid #00ff00;
            text-decoration: none;
            display: block;
        }
        .ascii-container:hover {
            border-color: #00ff99;
            box-shadow: 0 2px 10px rgba(0,255,0,0.2);
        }
        .timestamp {
            color: #00cc00;
            text-align: center;
            margin-bottom: 10px;
        }
        pre {
            white-space: pre;
            overflow-x: auto;
            margin: 0;
            padding: 10px;
            background: #000000;
            color: #00ff00;
            border: 1px solid #004400;
            font-size: 8px;
            line-height: 1;
        }
        h1 {
            color: #00ff00;
            text-align: center;
            text-shadow: 0 0 5px #00ff00;
        }
        .fullscreen {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: #000000;
            z-index: 1000;
            padding: 20px;
            overflow: auto;
        }
        .fullscreen pre {
            font-size: 14px;
        }
        .fullscreen:target {
            display: block;
        }
        .close-button {
            position: fixed;
            top: 20px;
            right: 20px;
            color: #00ff00;
            text-decoration: none;
            font-size: 24px;
            border: 1px solid #00ff00;
            padding: 5px 10px;
            border-radius: 5px;
        }
        .close-button:hover {
            background: #004400;
        }
    </style>
</head>
<body>
    <h1>ASCII Art Gallery</h1>
    <div class="gallery">' > index.html

# Process each ASCII file
for file in *_ascii.txt; do
    if [ -f "$file" ]; then
        timestamp=$(echo "$file" | sed 's/_UTC_ascii.txt//' | sed 's/_/-/g')
        id=$(echo "$timestamp" | sed 's/[^0-9a-zA-Z]/-/g')
        
        # Add gallery item
        echo "    <a href='#${id}' class='ascii-container'>
        <div class='timestamp'>$timestamp</div>
        <pre>" >> index.html
        cat "$file" | sed 's/&/\&amp;/g; s/</\&lt;/g; s/>/\&gt;/g' >> index.html
        echo "</pre>
    </a>" >> index.html

        # Add fullscreen version
        echo "    <div class='fullscreen' id='${id}'>
        <a href='#' class='close-button'>×</a>
        <pre>" >> index.html
        cat "$file" | sed 's/&/\&amp;/g; s/</\&lt;/g; s/>/\&gt;/g' >> index.html
        echo "</pre>
    </div>" >> index.html
    fi
done

echo "    </div>
</body>
</html>" >> index.html

echo "Gallery created as index.html"

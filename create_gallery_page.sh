#!/bin/bash

# [previous style section remains the same]

# Function to format date
format_date() {
    local timestamp=$1
    # Extract year, month, day from timestamp
    local year=$(echo $timestamp | cut -d'-' -f1)
    local month=$(echo $timestamp | cut -d'-' -f2)
    local day=$(echo $timestamp | cut -d'-' -f3)
    
    # Convert month number to name
    case $month in
        01) month="January" ;;
        02) month="February" ;;
        03) month="March" ;;
        04) month="April" ;;
        05) month="May" ;;
        06) month="June" ;;
        07) month="July" ;;
        08) month="August" ;;
        09) month="September" ;;
        10) month="October" ;;
        11) month="November" ;;
        12) month="December" ;;
    esac
    
    echo "$month $day, $year"
}

[rest of the header remains the same]

# For the "On This Day" section
for file in $(ls -1 *"$TODAY"*_ascii.txt 2>/dev/null); do
    if [ -f "$file" ]; then
        timestamp=$(echo "$file" | sed 's/_UTC_ascii.txt//' | sed 's/_/-/g')
        id=$(echo "$timestamp" | sed 's/[^0-9a-zA-Z]/-/g')
        display_date=$
./create_gallery_page.sh
git add create_gallery_page.sh index.html
git commit -m "Updated date format to be more readable"
git push
cat > create_gallery_page.sh << 'ENDSCRIPT'
#!/bin/bash

[previous styles remain the same]

echo '<!DOCTYPE html>
<html>
<head>
    <title>ASCII Art Gallery for @ChristmasFreud</title>
    <style>
        [previous styles remain the same]
        
        .site-title {
            color: #00ff00;
            text-align: center;
            text-shadow: 0 0 5px #00ff00;
            margin-bottom: 10px;
        }
        
        .subtitle {
            color: #00cc00;
            text-align: center;
            font-size: 1.2em;
            margin-bottom: 40px;
        }

        .twitter-link {
            color: #00ff00;
            text-decoration: none;
        }

        .twitter-link:hover {
            text-shadow: 0 0 8px #00ff00;
        }
    </style>
</head>
<body>
    <h1 class="site-title">ASCII Art Gallery</h1>
    <div class="subtitle">for <a href="https://twitter.com/ChristmasFreud" class="twitter-link" target="_blank">@ChristmasFreud</a></div>

[rest of script remains the same]

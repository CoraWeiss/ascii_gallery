#!/bin/bash

# Create script
echo '#!/bin/bash
mkdir -p ../yourgithubpages-repo/ascii-gallery
cp index.html ascii_outputs/* ../yourgithubpages-repo/ascii-gallery/
cd ../yourgithubpages-repo
git add ascii-gallery
git commit -m "Add ASCII art gallery"
git push' > deploy_gallery.sh

# Make it executable
chmod +x deploy_gallery.sh

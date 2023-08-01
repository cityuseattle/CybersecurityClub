#!/bin/bash

# Create directories
mkdir -p _layouts _posts _includes docs docs/Documentation docs/Tutorials_and_Training_Materials docs/Projects_and_Research docs/CTFs_and_Challenges docs/Tools_and_Software docs/Discussion_and_Ideas docs/Miscellaneous assets/css assets/js assets/img

# Create files
touch README.md _config.yml _layouts/default.html _layouts/post.html _includes/header.html _includes/footer.html docs/Club_Overview.md docs/Membership_Guidelines.md docs/Documentation/Meeting_01.md docs/Documentation/Meeting_02.md docs/Tutorials_and_Training_Materials/Getting_Started/Guide_01.md docs/Tutorials_and_Training_Materials/Workshop_Materials/Workshop_01.md docs/Tutorials_and_Training_Materials/External_Resources.md docs/Projects_and_Research/Project_01/README.md docs/Projects_and_Research/Project_02/README.md docs/Projects_and_Research/Research_Papers/Paper_01.md docs/CTFs_and_Challenges/Past_Challenges/Challenge_01.md docs/CTFs_and_Challenges/Upcoming_CTFs.md docs/CTFs_and_Challenges/Practice_Challenges/Challenge_01.md docs/Tools_and_Software/Open_source_Tools/Tool_01.md docs/Tools_and_Software/Custom_Tools/Tool_01.md docs/Discussion_and_Ideas/Idea_Tracker.md docs/Discussion_and_Ideas/Discussions.md docs/Miscellaneous/Events.md docs/Miscellaneous/Links_and_References.md assets/css/main.scss assets/js/main.js assets/img/logo.png index.md

# Print success message
echo "Directory structure created successfully!"

#!/bin/bash

# Get hosts file and sort it

cd      /home/scy/Documents/git/stevenblack-hosts								# Go to the working directory
wget    https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-social/hosts	# Download the hosts file
sed     -i -e '1,34d' hosts 											# Remove the shitty localhost config
cat     ./hosts | grep -vwFf ./filter > halfbaked-hosts								# Filter Reddit and Twitter so they won't get blocked. Also bake them
mv      ./halfbaked-hosts ./stevenblack-hosts									# Rename the file to make it easier to manage

# Now combine them	

cat     custom-hosts stevenblack-hosts > finished-hosts # Combines the custom-hosts and stevenblack-hosts file into one big cake

# Now move it and clean after yourself

sudo mv ./finished-hosts /etc/hosts	# Apply the hosts file. The cake is now a lie
rm      ./stevenblack-hosts		# Remove leftovers
rm      ./hosts				# Remove leftovers

# Done

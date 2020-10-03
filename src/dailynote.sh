# Obsidian Daily Note workflow that adds breadcrumb and heading - Version 1.0
# Date Format is the default YYYY-MM-DD (check your obsidian settings)
# You must turn on DAILY NOTES in your settings and choose a template file location in settings
# Edit your template file to whatever you want, this script just appends a breadcrumb and heading.
# Only edit 1, 2, and 3.

# 1. Enter your Vault name; Change 'obsidian' to your vault name.
vault="obsidian"

# 2. Enter where your Vault is located (default is 'Macintosh HD/Users/<YourName>/Documents' )
# Don't add forwardslash at the end
loc=$HOME"/Documents"

# get date
d=$(date +"%Y-%m-%d")
dminus=$(date -j -v -1d -f "%Y-%m-%d" "$d" +%Y-%m-%d)
dplus=$(date -j -v +1d -f "%Y-%m-%d" "$d" +%Y-%m-%d)

# 3. heading with format: h2 Day of week, MM DD YYYY
# can edit below for a custom heading that appears below the breadcrumb. 
# Default is 'h2 + day of the week, Month, Date, Year'. change "%A, %B %d %Y". https://www.howtogeek.com/410442/how-to-display-the-date-and-time-in-the-linux-terminal-and-use-it-in-bash-scripts

head="## "$(date +"%A, %B %d %Y")


# create breadcrumb
#crumb="<sup><\ [[${dminus}]]\ |\ [[${dplus}]]\ ></sup>"
crumb="<\ [[${dminus}]]\ |\ [[${dplus}]]\ >"

# Gets the Directory of your Daily Template from your settings
# This reads the location of obsidian's settings file
line=$(head -n 1 $loc/$vault/.obsidian/daily-notes.json)
ct=$( echo "$line" |cut -d'"' -f 4 )

# Full path to your daily template
templatepath=$loc/$vault/$ct.md

# Full path to your daily note (Obsidian settings should be 'Vault folder' for Default location for notes.
notepath=$loc/$vault/$d.md

# Checks if Daily Note exists, if not; creates the Daily Note
[[ -f $notepath ]] && echo "file exists" || cp -n $templatepath $notepath

# Checks for breadcrumb and adds it and the heading if there isn't one
line2=$(head -n 1 $notepath)
esccrumb=$(echo $crumb | sed 's/\\//g')

[ "$line2" == "$esccrumb" ] && echo "breadcrumb exists" || sed -i '' '1s/^/'"$head"'\'$'\n/; 1s/^/'"$crumb"'\'$'\n/\n' $notepath

# Appends just the breadcrumb (Format must be YYYY-MM-DD)
#sed -i '' '1s/^/'"$crumb"'\'$'\n/' $loc/$vault/$d.md

# URL scheme to open
path="obsidian://vault/$vault/$d.md"

# open daily note (opening twice fixes opening the note)
open "$path"
open "$path"

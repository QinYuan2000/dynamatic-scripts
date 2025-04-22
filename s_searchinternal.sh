#!/bin/bash

# Output file (clear at start)
output_file="./internal_buf_lines.txt"
> "$output_file"

# Temporary files for grouping
opaque_tmp="./opaque_tmp.txt"
transparent_tmp="./transparent_tmp.txt"

# Clear temporary files
> "$opaque_tmp"
> "$transparent_tmp"

# Find all placement.log files in current directory and subdirectories
find . -type f -name "placement.log" | while read -r logfile; do
    echo "Processing $logfile"

    awk -v file="$logfile" -v opaque_out="$opaque_tmp" -v trans_out="$transparent_tmp" '
    {
        line[NR] = $0
    }

    /opaque slots: \[1,/ {
        if (NR > 3) {
            if (!opaque_file_printed) {
                print "File: " file >> opaque_out
                opaque_file_printed = 1
            }
            print line[NR-3] >> opaque_out
        }
    }

    /transparent slots: \[1,/ {
        if (NR > 2) {
            if (!trans_file_printed) {
                print "File: " file >> trans_out
                trans_file_printed = 1
            }
            print line[NR-2] >> trans_out
        }
    }
    ' "$logfile"
done

# Output opaque section
echo "== Opaque matches ==" >> "$output_file"
if [ -s "$opaque_tmp" ]; then
    cat "$opaque_tmp" >> "$output_file"
else
    echo "No matches found." >> "$output_file"
fi

echo "" >> "$output_file"

# Output transparent section
echo "== Transparent matches ==" >> "$output_file"
if [ -s "$transparent_tmp" ]; then
    cat "$transparent_tmp" >> "$output_file"
else
    echo "No matches found." >> "$output_file"
fi

# Cleanup temporary files
rm "$opaque_tmp" "$transparent_tmp"

echo "Finished! Results are in $output_file"
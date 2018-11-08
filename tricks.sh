# File permissions
chmod 444 sample.txt # owner | r    /  other | r
chmod 700 sample.txt # owner | rwx  /  other |
chmod 744 sample.txt # owner | rwx  /  other | r
chmod 777 sample.txt # owner | rwx  /  other | rwx

# Modify file permissions of many sub files and directories
find ./ -type f -exec chmod 644 {} \;
find ./ -type d -exec chmod 755 {} \;

# Submit basic qsub job
qsub -P montilab -e std.err -o std.out run.qsub

# Join stderr and stdout
qsub -P montilab -o std.out -j y run.qsub

# Submit qsub job with more resources
qsub -P montilab -l h_rt=96:00:00 -l mem_total=94G -pe omp 16 -e std.err -o std.out run.qsub

# Get job information for a specific job
qstat -u 52104

# Get information for all current jobs by user
qstat -u anfed

# Delete a specific job
qdel -j 52104

# Delete all jobs current jobs by user
qdel -u anfed

# Find a past command with nextflow in it
history | grep nextflow

# List all files, in long formated, sorted by size (asc and desc)
ls –alS
ls –alSr

# Append a file to end of another
cat chr17.fasta >> hg38.fasta

# Display lines starting with @
grep “^@*” counts.txt

# A better version of tail -f
less +F file.txt

# Open crontab in nano
export VISUAL=nano; crontab -e

# Disk usage
quota anfed
pquota -u montilab-p

# Groups
groups anfed

# Rstudo server
ssh anfed@scc4.bu.edu -L 1234:localhost:8787
http://localhost:1234/

# Screen sharing tunnel
ssh anfed@scc4.bu.edu
vncstart
ssh anfed@scc4.bu.edu -L 1234:localhost:5915 # Local
vnc://localhost:1234

# Interactive qsub
qrsh -P montilab-p -l h_rt=24:00:00 -pe omp 4

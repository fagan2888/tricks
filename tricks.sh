# Submit basic qsub job
qsub -P montilab -e std.err -o std.out run.qsub

# Submit qsub job with more resources
qsub -P <project> -l h_rt=96:00:00 -l mem_total=94G -pe omp 16 -e std.err -o std.out run.qsub

# Get job information for a specific job
qstat -u 52104

# Get information for all current jobs by user
qstat -u anfed

# Delete a specific job
qdel -j 52104

# Delete all jobs current jobs by user
qdel -u anfed

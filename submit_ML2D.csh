#!/bin/csh

# Requested queue
#$ -q barcelona.q

# Name of job
#$ -N ML2D

# Use openmpi parallel environment; set number of slots
#$ -pe orte 20

# Max walltime for this job is X minutes
#$ -l h_rt=144:00:00

# Merge the standard out and standard error to one file
##$ -j y

# Run job through csh shell
#$ -S /bin/csh

# Use current working directory
#$ -cwd

# Change to current working directory
cd $SGE_O_WORKDIR

# The following is for reporting only. It is not needed
# to run the job. It will show up in your output file.
echo "Job starting `date`"
echo "Current working directory: $cwd"
echo "Got $NSLOTS slots."

set input = $1
set refs = $2

# The job

mpirun -np $NSLOTS xmipp_mpi_ml_align2d -i $input -nref $refs -iter 25 -o RunML2D/ml2d -fast

touch "ML3D is done"

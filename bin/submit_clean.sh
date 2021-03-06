#!/bin/sh
appName="cleanerPar"
echo "#!/bin/sh
#SBATCH --job-name=$appName
#SBATCH --exclusive
#SBATCH -t30:59:00
#SBATCH --workdir=.
#SBATCH -o $appName-%J.out
#SBATCH -e $appName-%J.err
#SBATCH -N1
#SBATCH -n12

export PYTHONPATH="$PYTHONPATH:/gpfs/home/bsc19/bsc19277/contextualLSTM/src/"
python /gpfs/home/bsc19/bsc19277/contextualLSTM/src/preprocess/cleaner.py -d /gpfs/home/bsc19/bsc19277/contextualLSTM/data/enwiki -w /gpfs/home/bsc19/bsc19277/contextualLSTM/models/word2id_1000.pklz" > job

sbatch < job
rm job
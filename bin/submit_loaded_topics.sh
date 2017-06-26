#!/bin/sh
appName="hdp_topicsLoadedAnalysis"
echo "#!/bin/sh
#SBATCH --job-name=$appName
#SBATCH --exclusive
#SBATCH -t32:00:00
#SBATCH --workdir=.
#SBATCH -o $appName-%J.out
#SBATCH -e $appName-%J.err
#SBATCH -N1
#SBATCH -n12

export PYTHONPATH="$PYTHONPATH:/gpfs/home/bsc19/bsc19277/contextualLSTM/src/"
python /gpfs/home/bsc19/bsc19277/contextualLSTM/src/lda/lda.py -d /gpfs/home/bsc19/bsc19277/contextualLSTM/data/enwiki -m /gpfs/home/bsc19/bsc19277/contextualLSTM/models/topics -c /gpfs/home/bsc19/bsc19277/contextualLSTM/models/gensim_tfidf.mm.bz2 -i /gpfs/home/bsc19/bsc19277/contextualLSTM/models/gensim_wordids.txt.bz2 " > job

sbatch < job
rm job
#SBATCH --dependency=afterany:753016

#SBATCH --mem=100000

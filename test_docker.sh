singularity exec docker://ghcr.io/pamelanmrc/rna-seq-nextflow-docker:latest \
  bash -lc 'which STAR; STAR --version; which fastqc; which samtools'



process cpy_fasta {

    input:
        tuple val(species), path(fasta), val(fasta_path)

    output:
        tuple val(species), path(fasta)

    publishDir "${params.fantasia_dir}/fasta_tmp", mode: 'copy'

    script:
    """
    echo "Archivo $fasta copiado"
    """
}

process run_fantasia {

    publishDir "${params.outdir}/${species}", mode: 'copy'

    input:
        tuple val(species), path(fasta)

    output:
        path "${species}.fantasia_results.csv"

    script:
    """
    fantasia_pipeline \
        --serial-models \
        --embed-models ${params.fantasia_models.join(' ')} \
        --results-csv ${species}.fantasia_results.csv \
        fasta_tmp/${fasta.getName()}
    """
}

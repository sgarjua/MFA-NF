
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
        --embed-models ${params.fantasia_models} \
        --results-csv ${species}.fantasia_results.csv \
        ${fasta.getName()}
    """
}

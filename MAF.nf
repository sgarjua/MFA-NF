// Default parameter input
params.input = "./test/test.tsv"

// split process
process split {
    
    input:
    
    output:

    script:
    """
    
    """
}



// Workflow block
workflow {
    ch_samples = channel.fromPath(params.input)
        .map { row ->
            return row
        }
        .view()
}
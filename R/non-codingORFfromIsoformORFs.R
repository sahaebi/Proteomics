## This R code Reads (1) the list of known proteins with/without SAPs, (2) isoforms with/without SAPs, and (3) the list of ORFs classified according to their
## transcript bio-type. Aim of this code is to exclude (1) from the list of (3).

source("D:/Code/Proteomics/R/RLib.R")
readList<-function(filepath)
{
    as.matrix(read.csv(file=filepath, header=TRUE))
}

subsetProteins<-function(Mat1, MatList)
{
    
}
main<-function(knownPro, knownProSAP, iso, isoSAP, nonCDSFileNameList)
{
    ## Read a) known proteins, b) known proteins with SAPs including ALT/INDELs, c) isoforms, and d) isoforms with SAPs/ALT/INDELs
    ## Known Protein
    knownProteins=readList(knownPro)
    ## Known with SAPs/ALT/INDELs
    knownProteinsSAPs=readList(knownProSAP)
    ## Isoforms
    isoforms=readList(iso)
    ## Isoforms with SAPs/ALT/INDELs
    isoformsSAPs=readList(isoSAP)
    ## Read i) anisense, ii) linc, iii) nonsense-mediated decay, iv) processed transcript, v) reatined intron and any other ORFs from
    ## non CDS RNA bio type.
    nonCDS=list()
    for(i in 1:length(nonCDSFilenameList))
    {
        nonCDS[i]=readList(nonCDSFilenameList[i])
    }
    ## Remove all proteins/ORFs from i-v if they are found in a. Make separate lists of those ORFs/proteins from the i-v lists that
    ## exist in b, c or d.
    ##
    subsetProteins(knownProteins,nonCDS)
    subsetProteins(knownProteinsSAPs,nonCDS)
    subsetProteins(isoforms,nonCDS)
    subsetProteins(isoformsSAPs,nonCDS)
}
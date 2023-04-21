####################  Edited by: Justin M. Bernstein (2021)
#   COPHYLO CODE   #  Source code/referene: Revell, L. J. (2012) phytools: An R package for phylogenetic comparative biology (and other things). Methods Ecol. Evol., 3, 217-223.
####################


setwd("C:/Users/Justin/Documents/Publications/Homalopsid_Sanger_Phylogeny/Analyses/Final_Preliminary_Trees/cophylo/")

#Compare Tree Tips with each other: JUst change the input files for the two trees and run the code!
#Make sure your trees have the SAME tips, all characters (e.g., underscores, dashes, capital letters, etc.)
library(phytools)

#Read in your first tree
t1 <- read.tree("Homalopsidae_CytbPRLR_4-27-2020_ML.tree")
class(t1)

#Ignore this, as I reused this code as I get different trees. 
#You will see down below I run cophylo several times, and this
#is only because I different comparisons I wanted to make.
# t2 <- read.newick("Homalopsidae_CytbPRLR_4-27-2020_BI_NOTFINAL.tree")
# class(t2)
# plot(t2)

#Read in your second tree
t3 <- read.newick("Homalopsidae_CytbPRLR_4-27-2020_BI.tree") 
class(t3)

#set outgroups as cophylo will do its best to order the tree but isn't always 100% successful!
#outgroups can be stored in an outgroups object; do this for both trees
tiplabels(t1) #You can check the tip labels with this line
outgroups <- c("Laticauda frontalis AM???EBU13918 PRLR", "Laticauda laticaudata EBU13932???Elapidae", "Lamprophis fuliginosus PRLR", "Bungarus fasciatus???Elapidae CYTB", "Nerodia sipedon AF402913.1 CYTB","Crotalus horridus KJ730356 CYTB","Bitis nasicornis AY188009 CYTB")
outgroups


#Run cophylo; NOTE: you can make anim.cophylo=TRUE but it will take a lot longer because it will show you the animation of node rotation
obj<-cophylo(t1,t2,anim.cophylo=FALSE,link.type="curved",            
             link.lwd=3,link.lty="solid",lwd=2,
             link.col=make.transparent("blue",0.25),fsize=0.4)

plot(obj,link.type="curved",link.lwd=3,link.lty="solid",
     lwd=2,link.col=make.transparent("blue",0.25),fsize=0.1)

#Here we can rotate the initial trees so we have a descending ladderized tree
t1_rotate <- rotateNodes(t1,"all")
t2_rotate <- rotateNodes(t2,"all")
t3_rotate <- rotateNodes(t3,"all")


obj_rotate<-cophylo(t1_rotate,t2_rotate,anim.cophylo=FALSE,link.type="curved",
                    link.lwd=3,link.lty="solid",lwd=2,
                    link.col=make.transparent("blue",0.25),fsize=0.4)


plot(obj_rotate,link.type="curved",link.lwd=3,link.lty="solid",
     lwd=2,link.col=make.transparent("blue",0.25),fsize=0.1)


#This next one is comparing the ML an the final BI analysis
obj_rotate.final<-cophylo(t1_rotate,t3_rotate,anim.cophylo=FALSE,link.type="curved",
                          link.lwd=3,link.lty="solid",lwd=2,
                          link.col=make.transparent("blue",0.25),fsize=0.4)


plot(obj_rotate.final,link.type="curved",link.lwd=3,link.lty="solid",
     lwd=2,link.col=make.transparent("blue",0.25),fsize=0.1)

#Comparing both BI analyses
obj_rotate.BI<-cophylo(t2_rotate,t3_rotate,anim.cophylo=FALSE,link.type="curved",
                       link.lwd=3,link.lty="solid",lwd=2,
                       link.col=make.transparent("blue",0.25),fsize=0.4)


plot(obj_rotate.BI,link.type="curved",link.lwd=3,link.lty="solid",
     lwd=2,link.col=make.transparent("blue",0.25),fsize=0.1)

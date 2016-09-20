.PHONY: all fasta features test clean

all: clean fasta genome chr-count chr-size features gene-count verified-genes uncharacterized-genes verified-silent-genes dubious-genes gene-types palinsreg terminated-genes

clean:
	find . \( -name \*gene\* -o -name chr-\* \) -exec rm {} \;
	find ./fasta  \( -name \*.fsa -o -name genome.fa -o -name download.success \) -exec rm {} \;

fasta:
	echo "Download files into \"fasta\" directory"
	yeast=http://downloads.yeastgenome.org/sequence/S288C_reference/chromosomes/fasta/; \
	if [[ ! -f fasta/download.success ]]; then \
	  wget -nd -P fasta $$yeast/chr{01..16}.fsa; wget -nd -P fasta $$yeast/chrmt.fsa; echo SUCCESS > fasta/download.success;\
	fi;


genome: fasta
	for i in {01..16}; do sed 's/^>.*/>/' ./fasta/chr$$i.fsa > test >> fasta/genome.fa; done
	sed 's/^>.*/>/' ./fasta/chrmt.fsa > test >> fasta/genome.fa
	rm test
	
	

chr-count: genome
	count=$$(grep -c '>' fasta/genome.fa); size=$$(echo "$$count-1" | bc); echo $$size  > chr-count


chr-size: genome
	a=$$(wc -c fasta/genome.fa | awk '{print $$1}'); l=$$(grep -o '>' fasta/genome.fa | wc -c); size=$$(echo "$$a-$$l" | bc); echo $$size > chr-size; 


features:
	echo "Download SGD_features.tab"
	if [[ ! -f SGD_features.tab ]]; then\
	  wget http://downloads.yeastgenome.org/curation/chromosomal_feature/SGD_features.tab;\
	fi;


gene-count: features
	cut -f 2 SGD_features.tab | grep -c 'ORF' > gene-count
	
verified-genes: features
	cut -f 3 SGD_features.tab | grep -c 'Verified' > verified-genes

uncharacterized-genes: features
	cut -f 3 SGD_features.tab | grep -c 'Uncharacterized' > uncharacterized-genes

dubious-genes: features
	cut -f 3 SGD_features.tab | grep -c 'Dubious' > dubious-genes 

verified-silent-genes: features
	cut -f 3 SGD_features.tab | grep -c 'Verified|silenced_gene' > verified-silent-genes 

gene-types: features
	vs=$$(cat verified-silent-genes); d=$$(cat dubious-genes); u=$$(cat uncharacterized-genes); v=$$(cat verified-genes);\
	count=$$(echo "$$vs+$$d+$$u+$$u" | bc);\
	echo $$count > gene-types 

palinsreg:
	if [[ ! -f palinsreg.txt ]]; then\
	  wget ftp://ftp.imicrobe.us/abe487/yeast/palinsreg.txt;\
	fi;
	

terminated-genes: palinsreg
	grep -o -P '/G=[\w.]*' palinsreg.txt | cut -d '=' -f 2 | sort | uniq > terminated-genes


test:
	./test.pl6

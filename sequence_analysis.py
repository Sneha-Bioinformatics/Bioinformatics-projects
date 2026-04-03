# Simple DNA sequence analysis

sequence = "ATGCGTACGTAGCTAGCTAGCTAGCTA"

# Length of sequence
print("Length:", len(sequence))

# Count nucleotides
print("A:", sequence.count("A"))
print("T:", sequence.count("T"))
print("G:", sequence.count("G"))
print("C:", sequence.count("C"))

# GC content
gc_content = (sequence.count("G") + sequence.count("C")) / len(sequence) * 100
print("GC Content:", gc_content)

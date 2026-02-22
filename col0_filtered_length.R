library(Biostrings)
library(ggplot2)

# 读取 FASTQ
fq <- readDNAStringSet("~/Pb/rdr6/siRNAseq/SRR30163306_1.fastq.gz", format="fastq")

# 计算每条序列长度
lens <- width(fq)

#过滤，保留18-30bp的小RNA
lens_filtered <- lens[lens >= 18 & lens <= 30]

# base R 直方图
hist(lens_filtered, breaks = seq(18, 30, 1),
     main = "col0 sRNA Length Distribution (18-30 nt)",
     xlab = "Length (nt)", ylab = "Count")

# 或者用ggplot2 更漂亮
df <- data.frame(length = lens_filtered)
ggplot(df, aes(x=length)) +
  geom_histogram(binwidth = 1, fill="steelblue", color="black") +
  theme_minimal() +
  xlab("Length (nt)") + ylab("Count") +
  ggtitle("col0 sRNA Length Distribution (18-30 nt)")+
  theme(plot.title = element_text(hjust = 0.5))

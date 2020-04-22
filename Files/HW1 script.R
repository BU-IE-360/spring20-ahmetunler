install.packages("readxl")
install.packages("xts")
library("readxl")
library("xts")
the_data <- read_excel(file.choose())
Sys.setlocale(locale= "en_US.UTF-8")
tarihler <- the_data[,1]
tarih_mat <- as.matrix.data.frame(tarihler)
years <- substr(tarih_mat, 1, 4)
months <- substr(tarih_mat, 6, nchar(tarih_mat))
a <- paste("01", "-", months,"-",years , sep = "")
date_ver <- as.Date(a, "%d-%B-%Y")
date_ver
veriler <- the_data[,2:8]
col_names_vector <- c("bulgar_ziyaretci", "paki_ziyaretci", "kuveyt_ziyaretci", "yab_sey_gelir", "b_leva_oran", "p_rupi_oran", "k_dinar_oran")
colnames(veriler) <- col_names_vector
sonveri <- xts(veriler, order.by = date_ver)
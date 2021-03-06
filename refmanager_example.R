#-------------------------------------------------------------------
# REFMANAGER EXAMPLE
#-------------------------------------------------------------------

## Le�r�s:
# https://tclavelle.github.io/blog/reference_tips/

## A blogbejegyz�shez k�pest m�dosul�s, hogy a f�ggv�ny haszn�lat�hoz l�tre kell hozni egy private key-t
## Ezt a Zotero online fel�let�n bel�p�s ut�n a Settings > Feeds/API f�l�n tehetj�k meg
## Az �gy l�trej�v� private key-t kell majd megadni key param�terk�nt

## A Zotero online-ba vigy�k fel a k�vetkez� forr�sokat:
# https://www.amazon.com/Action-Data-Analysis-Graphics/dp/1617291382/ref=sr_1_4?s=books&ie=UTF8&qid=1517128184&sr=1-4&keywords=r+in+action
# https://www.amazon.com/Modern-Applied-Statistics-Computing/dp/0387954570
# https://www.amazon.com/R-Data-Science-Hadley-Wickham/dp/1491910399/ref=as_li_ss_tl?ie=UTF8&qid=1469550189&sr=8-1&keywords=R+for+data+science&linkCode=sl1&tag=devtools-20&linkId=6fe0069f9605cf847ed96c191f4e84dd

## P�lda script:

library(RefManageR)
library(tidyverse)

biblio <- ReadZotero(user = "numbersonly", .params = list(collection = 'numbersandletters', key="longstringofnumbersandletters"),delete.file = TRUE)

# Find article keys to reference when in citations
refs <- biblio %>% {
  .$title
} %>%
  bind_rows() %>%
  gather(key = 'key', value = 'title', 1:length(biblio))

# Cite(biblio['reference_key'])
Cite(biblio['wickham_r_2017'])

Cite(biblio['venables_modern_2003'])

Cite(biblio['kabacoff_r_2015'])

## R Markdown alkalmaz�shoz a ggplot2 �ra .Rmd f�jlt megnyitva l�ttok p�ld�t

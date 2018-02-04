#-------------------------------------------------------------------
# REFMANAGER EXAMPLE
#-------------------------------------------------------------------

## Leírás:
# https://tclavelle.github.io/blog/reference_tips/

## A blogbejegyzéshez képest módosulás, hogy a függvény használatához létre kell hozni egy private key-t
## Ezt a Zotero online felületén belépés után a Settings > Feeds/API fülön tehetjük meg
## Az így létrejövõ private key-t kell majd megadni key paraméterként

## A Zotero online-ba vigyük fel a következõ forrásokat:
# https://www.amazon.com/Action-Data-Analysis-Graphics/dp/1617291382/ref=sr_1_4?s=books&ie=UTF8&qid=1517128184&sr=1-4&keywords=r+in+action
# https://www.amazon.com/Modern-Applied-Statistics-Computing/dp/0387954570
# https://www.amazon.com/R-Data-Science-Hadley-Wickham/dp/1491910399/ref=as_li_ss_tl?ie=UTF8&qid=1469550189&sr=8-1&keywords=R+for+data+science&linkCode=sl1&tag=devtools-20&linkId=6fe0069f9605cf847ed96c191f4e84dd

## Példa script:

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

## R Markdown alkalmazáshoz a ggplot2 óra .Rmd fájlt megnyitva láttok példát

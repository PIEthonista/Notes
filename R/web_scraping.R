install.packages(c("selectr", "xml2", "rvest", "stringr", "jsonlite"))
library(xml2)
library(rvest)
library(stringr)

#Specifying the url for desired website to be
scrappedurl <- "https://www.amazon.in/OnePlus-Mirror-Black-64GB-Memory/dp/B0756Z43QS?tag=googinhydr18418-21&tag=googinkenshoo-21&ascsubtag=aee9a916-6acd-4409-92ca-3bdbeb549f80"

#Reading the html content from
Amazonwebpage <- read_html(scrappedurl)

#scrape title of the product
title_html <- html_nodes(Amazonwebpage, 'h1#title')
title <- html_text(title_html)

# remove all space and new lines
title <- str_replace_all(title, "[\r\n]" , "")
head(title)

# scrape the price of the product
price_html <- html_nodes(Amazonwebpage, 'span#priceblock_ourprice')
price <- html_text(price_html)
price <- str_replace_all(price, "[\r\n]" , "")
head(price)

# scrape product description
desc_html <- html_nodes(Amazonwebpage, 'div#productDescription')
desc <- html_text(desc_html)
desc <- str_replace_all(desc, "[\r\n\t]" , "")

# remove tabs from text
desc <- str_trim(desc)
head(desc)

# scrape product rating
rate_html <- html_nodes(Amazonwebpage, 'span#acrPopover')
rate <- html_text(rate_html)
rate <- str_replace_all(rate, "[\r\n]" , "")
rate <- str_trim(rate)
head(rate)

# Scrape size of the product
size_html <- html_nodes(Amazonwebpage, 'div#variation_size_name')
size_html <- html_nodes(size_html, 'span.selection')
size <- html_text(size_html)
size <- str_trim(size)
head(size)

# Scrape product color
color_html <- html_nodes(Amazonwebpage, 'div#variation_color_name')
color_html <- html_nodes(color_html, 'span.selection')
color <- html_text(color_html)
color <- str_trim(color)
head(color)


#Combining all the lists to form a data frame
product_data <- data.frame(Title = title, Size=size, Color=color, Rating = rate)

#Structure of the data frame
str(product_data)

# Include ‘jsonlite’ library to convert in JSON form
library(jsonlite)

# convert dataframe into JSON format
json_data <- toJSON(product_data)

# print output
cat(json_data)

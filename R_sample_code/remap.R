# install necessary packages if required.
install.packages(c('devtools', 'XML'))  

# import necessary packages.
library(devtools) 

# install REmap package after importing devtools because installation from github needs devtools
# REmap package is for drawing fancy plot use. Which is developed by 'Baidu'.
install_github('lchiffon/REmap')

# import REmap package after installation
require(REmap)  

### librayr() vs. require()
# Normally there's no much different between both. The only difference is require() will 
# output warning then continue if the package not found. Afterwards, require() returns 
# logical value. TRUE if the package loaded, and FALSE if package not loaded. However, 
# library() will not continue if the package not found, and throws error. Thus, require() is 
# used inside functions, as it outputs a warning and continues if the package is not found.

# declare a variable and assign a vector with city names elements. 
city.vec = c("北京","Shanghai","廣州")

# get_city_coord() is a method of 'REmap', which is used for getting coordinates of the city.
# return latitude/longitude
get_city_coord("Shanghai") 

# get_geo_position() is a method from 'REmap' and which is used for getting a series coordinates 
# of a vector of cities.
# return a table which storing all geo info of cities. This type of table is called 'data.frame'
get_geo_position (city.vec)

### main area for drawing delivery plot ###

### plot a dynamical report to demonstrate the weight of each delivery route.

# set seed for generating a fixed random number. 
# basically, we use set.seed() when demo or debugging if we expect identical outcome or 
# result produced. 
set.seed(25)

# to set the origin point which is the city for sending.
origin <- rep("Beijing", 10)

# to set the destination points which are the cities for receiving.
destination <- c('上海','广州','大连','南宁','南昌',
                 '拉萨','长春','包头','重庆','常州')

# combine two vector as a table for plotting use.
# data.frame is the exact data structure we need and also meets requirements.
data <- data.frame(origin,destination)

# remap is one of methods in REmap, and also it is the main function for users to plot.
# usage: remap(mapdata, title, subtitle, theme)
# parameters description: 
# mapdata : requires a data frame including depart points in first column and 
#           destination points in second column.
# title : requires text content as main plot title.
# subtitle : requires text content as sub plot title.
# theme : to determine and control what color of map to display. Use function get_theme() to 
#         create a list object which contains the detailed infomation of a theme.   
out <- remap(mapdata=data, title="貨物運送圖", subtitle="我是範例", theme=get_theme("Dark"))

# use function plot() to draw the plot.
plot(out)

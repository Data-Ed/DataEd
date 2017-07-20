#################################################################################
## This example is based on 'R for Everyone: Advanced Analytics and Graphics'  ##
## by Jared P. Lander                                                          ##
#################################################################################

# install the necessary package.
install.packages('ggplot2')
install.packages('ggthemes')

# import necessary packages.
library(ggplot2)
library(ggthemes)

# draw base plot.
myPlot <- ggplot(diamonds, aes(x=carat, y=price)) + geom_point(aes(color=color))

### 'diamonds' is the diamonds data set in ggplot2. Type diamonds and ?diamonds to understand it. 

# add theme to beautify the plot.
myPlot + theme_solarized()                                # The Solarized palette style

### try more theme as below 
# myPlot + theme_economist() + scale_colour_economist()   # The Economist magazine style
# myPlot + theme_excel() + scale_colour_excel()           # The Excel style
# myPlot + theme_tufte()                                  # Edward Tufte style
# myPlot + theme_wsj()                                    # The Wall Street Journal style

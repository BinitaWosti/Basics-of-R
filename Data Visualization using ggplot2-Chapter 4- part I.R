#create a graphic using the mpg dataset, start with (need 3 mandatoyy component to visualize)
#Data
library(ggplot2)
ggplot(data = mpg)

#Mapping
#aes() function to pair data parts with graphical attributes
#To map cty and hwy to the x- and y-coordinates
ggplot(mpg, mapping = aes(x = cty, y = hwy))

#Layers
#Layers can be created using geom_*() and stat_*() functions
#geom_* functions to represent different types of geometric objects
  ggplot(mpg, aes(cty, hwy)) +
  geom_point() 
  
#addition of 1 more layer (smoothing, "lm") 
# + to add more function and layer
  ggplot(mpg, aes(cty, hwy)) +
  geom_point() +
  geom_smooth(formula = y ~ x, method = "lm")
  
#make labels  
ggplot(mpg, aes(cty, hwy)) +
  geom_point() + 	
  labs(x = "City MPG",
        y = "Highway MPG",
        title = "City vs Highway MPG")

#addition of smoothing function 
ggplot(mpg, aes(cty, hwy)) +
  geom_point() + 	
  geom_smooth(formula = y ~ x, method = "lm") +
  labs(x = "City MPG",
       y = "Highway MPG",
       title = "City vs Highway MPG") 

#map the class column in the mpg dataset to the viridis color palette
#Scales- # “d” stands for discrete
ggplot(mpg, aes(cty, hwy, color = class)) +
  geom_point() +
  scale_color_viridis_d()

#checking viridis
?viridis

data("mpg")
head(mpg)

#facets
ggplot(mpg, aes(cty, hwy)) +
  geom_point() +
  facet_grid(year ~ drv)

#adding color to the points in facet grid
ggplot(mpg, aes(cty, hwy, color = cty)) +
  geom_point() +
  scale_color_distiller() +
  facet_grid(year ~ drv)

#alternative way for continuous variable
ggplot(mpg, aes(cty, hwy, color = cty)) +
  geom_point() +
  scale_color_continuous() +
  facet_grid(year ~ drv)

#For continuous variables, the palette defines the gradient colors.
#For discrete variables, the palette defines the colors for each category.
ggplot(mpg, aes(cty, hwy, color = cty)) +
  geom_point() +
  scale_color_distiller(palette = "Green") +
  facet_grid(year ~ drv)

#see the palette function 
?palette
palette("ggplot2")
palette()

#coordinates   (Default aspect ratio 1:1)
ggplot(mpg, aes(cty, hwy)) +
  geom_point() +
  coord_fixed()

#Theme/ classic theme
ggplot(mpg, aes(cty, hwy, colour = class)) +
  geom_point() +
  theme_classic() +
  theme(
    legend.position = "top",
    axis.line = element_line(linewidth = 0.75),
    axis.line.x.bottom = element_line(colour = "blue")
  )

#Activity
ggplot(mpg, aes(cty, hwy, colour = class)) +
  geom_point() +
  theme_minimal() +
  theme(
    legend.position = "top",
    axis.title = element_text(size = 17),   
    axis.text = element_text(size = 12),    
    panel.grid.major = element_blank(),     
    panel.grid.minor = element_blank()        
  )

#changing theme/legend position/title & text size/
 #changing theme/legend position/title & text size/panel grid
ggplot(mpg, aes(cty, hwy, colour = class)) +
  geom_point() +
  theme_light() +
  theme(
    legend.position = "right",
    axis.title = element_text(size = 22),   
    axis.text = element_text(size = 25),    
    panel.grid.major = element_line(),     
    panel.grid.minor = element_line()        
  )

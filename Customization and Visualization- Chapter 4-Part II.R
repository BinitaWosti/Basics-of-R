library(ggplot2)

data("mpg")
head(mpg)

#Customization and Visualization
#Layer all the pieces to build customized plot

#geom_point - scatter plot, geom_smooth- adds a regression line, 
#method = "lm" → linear regression model, viridis color palette for continuous data,
#facet_grid()- small panels (subplots), coord_fixed()- equal x and y units, theme()- tweak plot appearance
ggplot(mpg, aes(cty, hwy)) +
  geom_point(mapping = aes(colour = displ)) +
  geom_smooth(formula = y ~ x, method = "lm") +
  scale_colour_viridis_c() +
  facet_grid(year ~ drv) +
  coord_fixed() +
  theme_minimal() +
  theme(panel.grid.minor = element_blank())

#changed scale color/ removed facet_grid/ changed theme, made addition
ggplot(mpg, aes(cty, hwy)) +
  geom_point(mapping = aes(colour = displ)) +
  geom_smooth(formula = y ~ x, method = "lm") +
  scale_colour_gradient2() +
  coord_fixed() +
  theme_classic() +
  theme(panel.grid.minor = element_blank(),
        panel.grid.major = element_blank(),
        axis.title = element_text(size = 30, face = "bold"))

#changed scale color/theme/ the face of axis title/ changed panel grid
ggplot(mpg, aes(cty, hwy)) +
  geom_point(mapping = aes(colour = displ)) +
  geom_smooth(formula = y ~ x, method = "lm") +
  scale_colour_viridis_c() +
  facet_grid(class ~ drv) +
  coord_fixed() +
  theme_bw() +
  theme(panel.grid.minor = element_blank(),
        panel.grid.major = element_line(),
        axis.title = element_text(size = 30, face = "italic"))


#changing the x-axis variable
ggplot(mpg, aes(model, hwy))+
  geom_violin(mapping = aes(color = displ)) +
  scale_colour_gradient2() +
  facet_grid(year ~ drv) +
  coord_fixed() +
  theme_bw() +
  theme(
    panel.grid.minor = element_blank(),
    panel.grid.major = element_blank(),
    axis.title = element_text(size = 20, face = "italic")
  )


#another type of plot/adjust the angle
ggplot(mpg, aes(trans, hwy))+
  geom_point(mapping = aes(colour = displ)) +
  scale_colour_gradient2() +
  facet_grid(year ~ drv) +
  theme_bw() +
  theme(
    panel.grid.minor = element_blank(),
    panel.grid.major = element_blank(),
    axis.title = element_text(size = 20, face = "bold"),
    axis.text.x = element_text(angle =45, hjust = 1)
  )
#Activity from the slide
#histogram
ggplot(mpg, aes(x = hwy)) +
  geom_histogram(binwidth = 5, fill = "blue", color = "black") +
  scale_colour_viridis_c() +
  facet_grid(year ~ drv) +
  coord_fixed() +
  theme_minimal() +
  theme(panel.grid.minor = element_blank())

#line
ggplot(economics, aes(date, unemploy))+
  geom_line(unemploy)+
  scale_colour_viridis_c() +
  facet_grid(year ~ drv) +
  coord_fixed() +
  theme_minimal() +
  theme(panel.grid.minor = element_blank())

#boxplot/ but not suitable for both numeric variable
ggplot(mpg, aes(class, hwy))+
  geom_boxplot(mapping = aes(colour = displ)) +
  scale_colour_continuous() +
  facet_grid(year ~ drv) +
  coord_fixed() +
  theme_bw() +
  theme(
    panel.grid.minor = element_blank(),
    panel.grid.major = element_blank(),
    axis.title = element_text(size = 20, face = "bold")
  )

#bar
ggplot(mpg, aes(x = manufacturer, fill = drv)) +
  geom_bar(position =  "stack", fill = "blue", color = "black") +
  scale_colour_viridis_c() +
  theme_minimal() +
  theme(panel.grid.minor = element_blank())

#bar2
ggplot(mpg, aes(x = manufacturer, fill = class)) +
  geom_bar(width = 1, fill = "blue", color = "black") +
  coord_polar(theta ="y") +
  theme_minimal() +
  theme(panel.grid.minor = element_blank(),
              panel.grid.major = element_blank())


#Practice with different data
data()
data(ToothGrowth)
head(ToothGrowth)

head(airquality )

ggplot(airquality, aes(Wind, Temp)) +
  geom_point(mapping = aes(colour = Ozone)) +
  geom_smooth(formula = y ~ x, method = "lm") +
  scale_colour_continuous() +
  facet_grid(Month~.) +
  coord_fixed() +
  theme_bw() +
  theme(
    panel.grid.minor = element_blank(),
    panel.grid.major = element_blank(),
    axis.title = element_text(size = 20),
    axis.text.x = element_text(angle =45, hjust = 1))

#Did some alterations
ggplot(airquality, aes(Month,Temp)) +
  geom_violin(aes(color = factor(Month)), trim = FALSE) +
  scale_colour_discrete() +
  theme_classic() +
  theme( 
    panel.grid.minor = element_blank(),
         panel.grid.major = element_blank(),
    axis.title = element_text(size = 14, face = "bold"),
axis.text.x = element_text(angle = 45, hjust = 1))
    
  
 
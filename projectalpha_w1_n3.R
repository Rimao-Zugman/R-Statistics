#cuando los datos no se distribuyen de manera homogenea o normal,
#entonces promedio y variación estándar no necesariamente te sirven,
#un ejemplo son los salarios.
#EJ.- unos salarios d eejecutivos y tenemos un histogram para verlo
# en el ejemplo tenemos un fat right tail, jerga de los estadisticos
#para denominar una linea baja hacia la derecha en la cual 
#hay puntos mas grandes que los esperados que si hubiera una 
#proporcion homogenea.
#el BOXPLOT nos sirve en este caso, y se trata de un gráfico por el cual nos 
#muestra5 numeros y outliers, y es simple: nos muesta la media o promedio, 
# y luego nos mostrará el ej que la media se aleja del promedio
#TAREA: qué son los outliers?

head(InsectSprays)
boxplot(split(values, factor))
print(InsectSprays)
colnames(InsectSprays)
View(InsectSprays)
boxplot(InsectSprays)
split(InsectSprays)
?split
split(InsectSprays,count, drop=FALSE)
class(InsectSprays)
?gl
length(InsectSprays)
InsectSprays[1:72,1]
InsectSprays[1:72,2]
sprays_types<-InsectSprays[1:72,2]
View(sprays_types)
split.data.frame(InsectSprays,value, drop = FALSE, A)

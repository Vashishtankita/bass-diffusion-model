## Set Seed
set.seed(1)
## Read in the Sales Data
sales <- read.csv("C:/Users/ankuv/Downloads/sales_data.csv")
## Create Cumulative Sales and Lag Cumulative Sales Variables 
sales$cumsales <- cumsum(sales$sales)
sales$cumsales_1 <- c(0, sales$cumsales[1:(length(sales$cumsales) - 1)])
sales$cumsales2 <- sales$cumsales^2
sales$cumsales2_1 <- c(0, sales$cumsales2[1:(length(sales$cumsales2) - 1)])
## Run the Bass Diffusion Model Regression
bass <- lm(sales ~ cumsales_1 + cumsales2_1, data = sales)
summary(bass) 
## Determine m, p, and q
## Determine m, p, and q
a <- coef(bass)[1]  ## Intercept
b <- coef(bass)[2]  ## Coefficient on cumsales_1
c <- coef(bass)[3]  ## Coefficient on cumsales2_1
# Check the values of a, b, and c
print(a)
print(b)
print(c)
N1 <- (-b + sqrt(b^2 - 4 * a * c)) / (2 * c)
N2 <- (-b - sqrt(b^2 - 4 * a * c)) / (2 * c)
N <- max(N1, N2)
names(N) <- "N"
p <- a / N
names(p) <- "p"
q <- b + p
names(q) <- "q"
print(N)
print(p)
print(q)
## Forecast the Sales
periods <- 50
t <- seq(1, periods)
forecasts <- data.frame(t = 1:periods)  # Initialize forecasts data frame
psales <- double(periods)
pcumsales <- double(periods + 1)

# Assuming p, q, and N are defined correctly
for (i in 1:periods){
  psales[i] <- p * N + (q - p) * pcumsales[i] - (q / N) * pcumsales[i]^2
  pcumsales[i + 1] <- pcumsales[i] + psales[i]
}

forecasts$psales <- psales
forecasts$pcumsales <- pcumsales[-1]  # Remove the first value which is 0
## Export the Two Data Sets
write.csv(sales, file="C:/Users/ankuv/Downloads/cumulative_sales_data.csv", row.names = FALSE) 
write.csv(forecasts, file="C:/Users/ankuv/Downloads/sales_forecasts.csv", row.names = FALSE) 

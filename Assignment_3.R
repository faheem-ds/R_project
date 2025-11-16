# Load your sakila CSVs (adjust paths)
film <- fread("film.csv")
language <- fread("language.csv")
customer <- fread("customer.csv")
store <- fread("store.csv")
staff <- fread("staff.csv")
rental <- fread("rental.csv")
payment <- fread("payment.csv")
inventory <- fread("inventory.csv")
film_category <- fread("film_category.csv")


#Q1
q1 <- film[rating == "PG" & rental_duration > 5]
print(q1)

# Q2: Average rental rate by rating
q2 <- film[, .(avg_rental_rate = mean(rental_rate)), by = rating]

# Show results in console
print(q2)


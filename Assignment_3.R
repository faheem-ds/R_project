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

#Q3
# Join film with language to get language names
film_lang <- merge(film, language, by.x = "language_id", by.y = "language_id", all.x = TRUE)

# Count total films per language
q3 <- film_lang[, .(total_films = .N), by = name]  # 'name' column from language

# Show results
print(q3)


#Q4
# Join customer with store to get store info
cust_store <- merge(customer, store, by.x = "store_id", by.y = "store_id", all.x = TRUE)

# Select customer full name and store info
q4 <- cust_store[, .(customer_name = paste(first_name, last_name), store_id)]

# Show results
print(q4)


#Q5
payment[, staff_id := as.integer(trimws(staff_id))]
staff[, staff_id := as.integer(trimws(staff_id))]

payment_staff <- merge(payment, staff, by = "staff_id", all.x = TRUE)

q5 <- payment_staff[, .(
  payment_id,
  amount,
  payment_date,
  staff_name = ifelse(is.na(first_name), "Unknown Staff", paste(first_name, last_name))
)]

print(q5)


generate_salary <- function() {
  return(runif(1, 5000, 35000))
}


generate_gender <- function() {
  return(sample(c("Male", "Female"), 1))
}


workers_list <- list()


generate_payment_slip <- function(worker) {
  tryCatch({
    salary <- worker$salary
    gender <- worker$gender
    
    if (10000 < salary && salary < 20000) {
      worker$level <- "A1"
    } else if (7500 < salary && salary < 30000 && gender == "Female") {
      worker$level <- "A5-F"
    } else {
      worker$level <- "Other"
    }
    
    cat("Payment Slip for Worker", worker$id, ":\n")
    cat("Name:", worker$name, "\n")
    cat("Salary: $", sprintf("%.2f", salary), "\n")
    cat("Employee Level:", worker$level, "\n\n")
  }, error = function(e) {
    cat("Error generating payment slip for Worker", worker$id, ":", conditionMessage(e), "\n\n")
  })
}


for (i in 1:400) {
  worker <- list(
    id = i,
    name = paste("Worker-", i, sep = ""),
    salary = generate_salary(),
    gender = generate_gender()
  )
  workers_list[[i]] <- worker
}


for (worker in workers_list) {
  generate_payment_slip(worker)
}


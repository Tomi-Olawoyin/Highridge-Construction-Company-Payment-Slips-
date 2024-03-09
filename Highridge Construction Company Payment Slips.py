import random

def generate_salary():
    return random.uniform(5000, 35000)


def generate_gender():
    return random.choice(["Male", "Female"])


def generate_payment_slip(worker):
    try:
        salary = worker["salary"]
        gender = worker["gender"]
        
        if 10000 < salary < 20000:
            worker["level"] = "A1"
        elif 7500 < salary < 30000 and gender == "Female":
            worker["level"] = "A5-F"
        else:
            worker["level"] = "Other"

        print(f"Payment Slip for Worker {worker['id']}:")
        print(f"Name: {worker['name']}")
        print(f"Salary: ${salary:.2f}")
        print(f"Employee Level: {worker['level']}")
        print("\n")

    except Exception as e:
        print(f"Error generating payment slip for Worker {worker['id']}: {str(e)}\n")


workers_list = []
for i in range(1, 401):
    worker = {
        "id": i,
        "name": f"Worker-{i}",
        "salary": generate_salary(),
        "gender": generate_gender()
    }
    workers_list.append(worker)


for worker in workers_list:
    generate_payment_slip(worker)
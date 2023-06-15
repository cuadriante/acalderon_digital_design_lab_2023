input_file = "final.txt"
output_file = "output.txt"

with open(input_file, "r") as file:
    values = file.readlines()

with open(output_file, "w") as file:
    for i, value in enumerate(values):
        file.write(f"{i} : {value.strip()};\n")

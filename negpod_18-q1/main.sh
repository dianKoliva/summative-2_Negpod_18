#registration application for student
students_file="students-list_1023.txt"
while true; do
    echo "--------------------------------------------------------"
    echo "Welcome to the ALU Student Registration System"
    echo "--------------------------------------------------------"
    echo "1. Create student record"
    echo "2. View all students"
    echo "3. Delete student record"
    echo "4. Update student record"
    echo "5. Exit"
    read -p "Please enter your choice (1/2/3/4/5): " choice

case $choice in
        1)
            read -p "Enter student email: " email
	    #checking if the email inserted is valid
	    if [[ $email =~ ^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$ ]]; then
            read -p "Enter student age: " age
            read -p "Enter student ID: " student_id
	    #checking if ID is unique
            if grep -q ", $student_id$" "$students_file"; then
                echo "Student with ID $student_id already exists."
            else
                # If the ID is not found, add the student record
                echo "$email, $age, $student_id" >> "$students_file"
                echo "Student information saved."
	    fi
	    else
                echo "Please enter a valid email address."
		fi
            ;;
        2)
		  #checking if the file exists and is not empty
            if [ -s "$students_file" ]; then
                cat "$students_file"
            else
                echo "No students found."
            fi
            ;;
        
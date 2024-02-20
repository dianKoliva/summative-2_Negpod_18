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
                echo "Student with ID $student_id already exists. Please enter a unique ID."
            else
                # If the ID is not found, add the student record
                echo "$email, $age, $student_id" >> "$students_file"
                echo "Student information saved"
	    fi
	    else
                echo "Please enter a valid email."
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
	     3)
	       read -p "Enter student ID to delete: " delete_id
	       #checking if ID exists
	       if grep -q ", $delete_id$" "$students_file"; then
            sed -i "/, $delete_id$/d" "$students_file"
            echo "Student with ID $delete_id deleted."
    else
	    echo "ID not found"
	       fi
            ;;
	     4)
	     echo "update student"
                  read -p "Enter student's Id: " studentId
                  if grep -q ",$studentId$" "$student_file"; then
        
                      read -p "Enter new student email: " new_email
                      read -p "Enter new Age: " new_age
        
                     # update student by Id
		     sed -i "/^.*$studentId\$/s/[^,]*,[^,]*,$studentId$/$new_email,$new_age,$studentId/" "$student_file"

                      echo "Student credentials updated successfully!"
                 else
                 echo "Student not found with this Id: $studentId"
             
                fi	
              ;;
	2)
                read -p "Enter new age: " new_age
sed -i "s/, $update_id$/, $new_age, $update_id/" "$students_file"
                    echo "Age updated."
		;;
	 *)
		echo "Invalid Choice"
esac

           else
                echo "Student with ID $update_id not found."
            fi
            ;;
    5)
	    echo "Exiting ......"
	    exit ;;
    *)
	    echo "Invalid Choice"
esac
done